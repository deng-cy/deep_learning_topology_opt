import torch
from utils import Batch_evaluate


class Truss:
    def __init__(self, device='cpu', batch_size=None, *args, **kwargs):
        self.device = device

        self.set_parameters_72bar(*args, **kwargs)
        self.pre_compute()
        self.set_discrete_thres()
        self.batch_eval = Batch_evaluate(batch_size)
        self.set_function()

    def set_parameters_10bar(self, n_node=6):
        '''
        This method is for reference only. Not used in optimization.
        '''
        assert n_node % 2 == 0, 'invalid n_node setting'
        self.n_node = n_node
        self.max_tension = 25000
        self.max_dis = 2
        self.density = 0.1
        self.n_dim = 2
        self.l = 360
        self.lb = 0.1
        self.ub = 35
        self.coords = self.l * torch.stack(torch.meshgrid(torch.arange(self.n_node // 2), torch.arange(2)), dim=-1).flatten(
            0, 1).type(torch.float).to(self.device)
        freedom = torch.ones((self.n_node, self.n_dim))
        freedom[0:2, :] = 0
        con = []
        for i in range(self.n_node):
            for j in range(1, 4):
                if i % 2 == 1 and j == 3:
                    continue
                if i + j < self.n_node and not (i == 0 and j == 1):
                    con.append([i, i + j])
        self.con = torch.tensor(con, device=self.device)
        self.load = torch.zeros((self.n_node, self.n_dim), device=self.device)
        self.load[self.n_node - 4, 1] = -1e5
        self.load[self.n_node - 2, 1] = -1e5

        self.free_mask = (freedom == 1).to(self.device)
        self.n_bar = self.con.shape[0]
        self.modulus = torch.ones(self.n_bar, device=self.device) * 1e7

    def set_discrete_thres(self):
        self.discrete_vals = torch.linspace(0.2, 3.2, self.n_dis)
        self.lb = self.discrete_vals[0]
        self.ub = self.discrete_vals[-1]
        self.discrete_vals = (self.discrete_vals - self.discrete_vals[0]) / (self.discrete_vals[-1] - self.discrete_vals[0])
        self.discrete_thres = (self.discrete_vals[:-1] + self.discrete_vals[1:]) / 2

    def apply_discrete_thres(self, area):
        not_yet_applied = torch.ones_like(area, dtype=torch.bool)
        for i, thres in enumerate(self.discrete_thres):
            mask = area < thres
            area.masked_fill_(mask & not_yet_applied, self.discrete_vals[i])
            not_yet_applied.masked_fill_(mask, False)
        area.masked_fill_(not_yet_applied, self.discrete_vals[-1])

    def set_parameters_72bar(self, n_node=20, n_dis=16):
        assert n_node % 4 == 0, 'invalid n_node setting'
        self.n_node = n_node
        self.max_tension = 25e3
        self.max_dis = (self.n_node / 4) ** 2 / 5 * 0.05
        self.density = 0.1
        self.n_dim = 3
        self.lb = 0.1
        self.ub = 3

        dx = 120.
        dy = 120.
        dz = 60  # 300./(self.n_node // 4)
        eps = 1e-6
        self.l = torch.tensor([dx, dy, dz]).to(self.device)

        self.coords = self.l * torch.stack(torch.meshgrid(torch.arange(self.n_node // 4), torch.arange(2), torch.arange(2)), dim=-1).flatten(
            0, 2).type(torch.float).to(self.device).flip(1)
        freedom = torch.ones((self.n_node, self.n_dim))
        freedom[self.coords[:, 2] == 0, :] = 0
        is_diff = torch.prod(torch.abs(self.coords.unsqueeze(0) - self.coords.unsqueeze(1)) <= (self.l + eps), dim=-1)  # connect neighbors
        is_dis = torch.cdist(self.coords.unsqueeze(0), self.coords.unsqueeze(0)).squeeze() < torch.linalg.norm(
            self.l) - eps  # remove 3d diagonal (e.g. node #1 and node #7 in the paper)
        con = torch.triu(is_dis * is_diff, diagonal=1).nonzero()
        self.con = con[(self.coords[con[:, 0], 2] != 0) | (self.coords[con[:, 1], 2] != 0)]  # delete z=0

        self.load = torch.zeros((self.n_node, self.n_dim), device=self.device)
        self.load[-1, 2] = -5e3

        self.free_mask = (freedom == 1).to(self.device)
        self.n_bar = self.con.shape[0]
        self.modulus = torch.ones(self.n_bar, device=self.device) * 1e7

        self.n_dis = n_dis

    def set_device(self):
        for keys, vals in self.__dict__.items():
            if isinstance(vals, torch.Tensor):
                setattr(self, keys, vals.to(self.device))

    def cuda(self):
        self.device = 'cuda'
        self.set_device()

    def cpu(self):
        self.device = 'cpu'
        self.set_device()

    def denormalize(self, area):
        # self.apply_discrete_thres(area)
        return area * (self.ub - self.lb) + self.lb

    def pre_compute(self):
        dis_vec = self.coords[self.con[:, 1], :] - self.coords[self.con[:, 0], :]
        self.length = torch.linalg.norm(dis_vec, dim=-1)
        self.T = dis_vec / self.length.view(-1, 1)  # distance unit vector or transformation vector
        self.matrix = torch.kron(torch.tensor([[1, -1], [-1, 1]], device=self.device), torch.einsum('ij,ik->ijk', self.T, self.T))
        self.idx = torch.cat((torch.arange(0, self.n_dim, device=self.device) + (self.con[:, 0] * self.n_dim).view(-1, 1),
                              torch.arange(0, self.n_dim, device=self.device) + (self.con[:, 1] * self.n_dim).view(-1, 1)), dim=1)
        self.free_list = self.free_mask.flatten()

    def get_solution(self, area):
        '''
        Solve a truss problem

        Args:
            coords : torch.Tensor, size = (self.n_node, n_dim), dtype = float64
                coordinates of nodes
            free_mask : torch.Tensor, size = (self.n_node, n_dim), dtype = boolean
                mask to show whether a dof is free (True) or not (False)
            load : torch.Tensor, size = (self.n_node, n_dim), dtype = float64
                indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]
            con : torch.Tensor, size = (n_bar, 2), dtype = int
                indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]
            area : torch.Tensor, size = (N, n_bar), dtype = float64
                area of bars

        Returns:
            u : torch.Tensor, size=(n_node, n_dim), dtype=float64
                displacement of nodes
            tension : torch.Tensor, size=(n_bar, ), dtype=float64
                tension of bars
            volume : torch.Tensor, size=(n_bar, ), dtype=float64
                volume of bars
        '''

        N = area.shape[0]
        sys = torch.zeros((N, self.n_dim * self.n_node, self.n_dim * self.n_node), dtype=torch.float, device=self.device)  # system matrix
        volume = self.length * area  # volume of bars
        G = self.modulus * area / self.length  # a temporary coefficient to be used later

        local_matrix = G[:, :, None, None] * self.matrix
        for i in range(self.n_bar):
            sys[:, self.idx[i].unsqueeze(0), self.idx[i].unsqueeze(-1)] += local_matrix[:, i]

        u = torch.zeros((N, self.n_node, self.n_dim), dtype=torch.float, device=self.device)  # displacement

        u_free = torch.linalg.solve(sys[:, self.free_list][:, :, self.free_list], self.load[self.free_mask].unsqueeze(-1))
        u[:, self.free_mask] = u_free.squeeze()

        TG = torch.einsum('ij,jk->ijk', G, self.T)  # projection coefficient
        tension = torch.sum(TG * (u[:, self.con[:, 1], :] - u[:, self.con[:, 0], :]), dim=-1)
        return u, tension, volume

    def get_score(self, area):
        u, tension, volume = self.batch_eval(self.get_solution, area)
        vio_tension = torch.abs(tension) / area / self.max_tension - 1  # tension violation
        penalty_tension = torch.sum(vio_tension * (vio_tension > 0), dim=-1)  # penalty of tension
        vio_dis = torch.abs(u) / self.max_dis - 1  # displacement violation
        penalty_dis = torch.sum(vio_dis * (vio_dis > 0), dim=(-1, -2))  # penalty of displacement
        weight = torch.sum(volume * self.density, dim=-1)
        score = weight * (1 + penalty_tension + penalty_dis) ** 2
        return score, weight, penalty_tension, penalty_dis

    def _func(self, x):
        self.apply_discrete_thres(x)
        score, *_ = self.get_score(self.denormalize(x))
        return score.view(-1, 1)

    def _func_reverse(self, x):
        return 1 / self._func(x)

    def set_function(self, inverse=False):
        if inverse:
            self.func = self._func_reverse
        else:
            self.func = self._func

    def get_function(self, inverse=None):
        if inverse is not None:
            self.set_function(inverse)
        return self.func

    def generate_input(self, n, base=None):
        '''
        Generate random input data according to the base solution `base`.
        `new_random` is uniformly sampled with mean of `base` and range of 2.
        Not all components of `base` will be replaced by `new_random`. A random variable `p` is uniformly sampled in [0,1] which indicates the ratio
        of the components in `base` that will be mutated.
        Args:
            n:
            base:

        Returns:

        '''
        new_random = base + torch.rand(n, self.n_bar, device=self.device)
        p = torch.linspace(0, 1, n, device=self.device)
        rand = torch.rand_like(new_random)
        mask = rand < p.unsqueeze(-1)
        idx = torch.randperm(mask.shape[0])
        mask = mask[idx, :]
        inputs = base.repeat(n, 1)
        inputs = torch.where(mask, new_random, inputs)
        inputs.masked_fill_(inputs > 1., 1.)
        inputs.masked_fill_(inputs < 0., 0.)
        self.apply_discrete_thres(inputs)
        return inputs
