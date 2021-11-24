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
        This method is for reference only to help readers understand how to solve a truss problem (i.e., how to get displacement, tension, etc. accorindg to load).
        This method is not used in optimization.
        See bottom of this file for an example.
        It reconstruct the truss algorithm in https://www.mathworks.com/matlabcentral/fileexchange/51250-truss-optimization-with-matlab-genetic-algorithm-ga-function
        Problem setting refers to Fig. 7 of the paper
            Camp, Charles V., and Mohammad Farshchin. "Design of space trusses using modified teaching–learning based optimization." Engineering Structures 62 (2014): 87-97.

        Inputs:
            n_node: int, number of nodes in the truss
        '''
        assert n_node % 2 == 0, 'invalid n_node setting'
        self.n_node = n_node
        self.max_tension = 25000  # maximum tension
        self.max_dis = 2  # maximum displacement
        self.density = 0.1  # mass density
        self.n_dim = 2  # two dimensions
        self.l = 360  # length of horizontal bars
        self.lb = 0.1  # lower bound of area
        self.ub = 35  # upper bound of area

        # self.coords: torch.Tensor, size = (n_node, n_dim), coordinates of nodes
        self.coords = self.l * torch.stack(torch.meshgrid(torch.arange(self.n_node // 2), torch.arange(2)), dim=-1).flatten(
            0, 1).type(torch.float).to(self.device)

        # set degrees of freedom, left two nodes are fixed
        freedom = torch.ones((self.n_node, self.n_dim))
        freedom[0:2, :] = 0

        # set connection relations
        con = []
        for i in range(self.n_node):
            for j in range(1, 4):
                if i % 2 == 1 and j == 3:
                    continue
                if i + j < self.n_node and not (i == 0 and j == 1):
                    con.append([i, i + j])
        self.con = torch.tensor(con, device=self.device)
        # self.con : torch.Tensor, size = (n_bar, 2), indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]

        # set load
        # self.load : torch.Tensor, size = (n_node, n_dim), indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]
        self.load = torch.zeros((self.n_node, self.n_dim), device=self.device)
        self.load[self.n_node - 4, 1] = -1e5
        self.load[self.n_node - 2, 1] = -1e5

        # free_mask : torch.Tensor, size = (n_node, n_dim), dtype = boolean, mask to show whether a dof is free (True) or not (False)
        self.free_mask = (freedom == 1).to(self.device)
        self.n_bar = self.con.shape[0]
        self.modulus = torch.ones(self.n_bar, device=self.device) * 1e7  # Young's modulus

    def set_parameters_72bar(self, n_node=20, n_dis=16):
        '''
        This method constructs our optimization problem
        Geometry refers to Fig. 10 of the paper
            Camp, Charles V., and Mohammad Farshchin. "Design of space trusses using modified teaching–learning based optimization." Engineering Structures 62 (2014): 87-97.
        Or Fig. 20 of the paper
            Farshchin, Mohammad, C. V. Camp, and Mohsen Maniat. "Multi-class teaching–learning-based optimization for truss design with frequency constraints." Engineering Structures 106 (2016): 355-369.
        Problem setting is slightly different from the above problems. Also, more blocks can be added to the truss to construct problems with more (>72) bars

        Inputs:
            n_node: int, number of nodes in the truss
            n_dis: int, number of allowed choices of bar areas
        '''
        assert n_node % 4 == 0, 'invalid n_node setting'
        self.n_node = n_node
        self.max_tension = 25e3  # maximum tension
        self.max_dis = (self.n_node / 4) ** 2 / 5 * 0.05  # maximum displacement, which changes with n_node to construct new problems
        self.density = 0.1  # mass density
        self.n_dim = 3  # three dimensions
        self.lb = 0.1  # lower bound of area
        self.ub = 3  # upper bound of area
        self.n_dis = n_dis  # number of allowed choices of bar areas

        dx = 120.  # distance between two adjacent nodes in x direction
        dy = 120.  # distance between two adjacent nodes in y direction
        dz = 60  # distance between two adjacent nodes in z direction
        eps = 1e-6
        self.l = torch.tensor([dx, dy, dz]).to(self.device)

        # self.coords: torch.Tensor, size = (n_node, n_dim), coordinates of nodes
        self.coords = self.l * torch.stack(torch.meshgrid(torch.arange(self.n_node // 4), torch.arange(2), torch.arange(2)), dim=-1).flatten(
            0, 2).type(torch.float).to(self.device).flip(1)

        # set degrees of freedom, bottom four nodes are fixed
        freedom = torch.ones((self.n_node, self.n_dim))
        freedom[self.coords[:, 2] == 0, :] = 0

        # whether nodes are neighbors/adjacent
        is_diff = torch.prod(torch.abs(self.coords.unsqueeze(0) - self.coords.unsqueeze(1)) <= (self.l + eps), dim=-1)
        # whether 3d diagonal (e.g. node #1 and node #7 in Fig. 20 of paper "Multi-class teaching–learning-based optimization for truss design with frequency constraints")
        is_dis = torch.cdist(self.coords.unsqueeze(0), self.coords.unsqueeze(0)).squeeze() < torch.linalg.norm(self.l) - eps
        con = torch.triu(is_dis * is_diff, diagonal=1).nonzero()
        self.con = con[(self.coords[con[:, 0], 2] != 0) | (self.coords[con[:, 1], 2] != 0)]  # delete connections at z=0
        # self.con : torch.Tensor, size = (n_bar, 2), indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]

        # add load
        # self.load : torch.Tensor, size = (n_node, n_dim), indices of nodes of a bar, the i-th bar starts from con[i,0] and ends at con[i,1]
        self.load = torch.zeros((self.n_node, self.n_dim), device=self.device)
        self.load[-1, 2] = -5e3

        # free_mask : torch.Tensor, size = (n_node, n_dim), dtype = boolean, mask to show whether a dof is free (True) or not (False)
        self.free_mask = (freedom == 1).to(self.device)
        self.n_bar = self.con.shape[0]
        self.modulus = torch.ones(self.n_bar, device=self.device) * 1e7  # Young's modulus

    def pre_compute(self):
        # This method is auxiliary of the `get_solution` method (below)
        # It extracts some computation irrelevant to `area` to reduce computational time
        # You'll need to first understand the theories to solve truss problems and read this method together with the `get_solution` method to understand
        dis_vec = self.coords[self.con[:, 1], :] - self.coords[self.con[:, 0], :]
        self.length = torch.linalg.norm(dis_vec, dim=-1)  # length of bars
        self.T = dis_vec / self.length.view(-1, 1)  # distance unit vector or transformation vector
        self.matrix = torch.kron(torch.tensor([[1, -1], [-1, 1]], device=self.device), torch.einsum('ij,ik->ijk', self.T, self.T))
        self.idx = torch.cat((torch.arange(0, self.n_dim, device=self.device) + (self.con[:, 0] * self.n_dim).view(-1, 1),
                              torch.arange(0, self.n_dim, device=self.device) + (self.con[:, 1] * self.n_dim).view(-1, 1)), dim=1)
        self.free_list = self.free_mask.flatten()

    def get_solution(self, area):
        '''
        Solve a truss problem

        Args:
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

        local_matrix = G[:, :, None, None] * self.matrix  # local stiffness matrix
        for i in range(self.n_bar):
            sys[:, self.idx[i].unsqueeze(0), self.idx[i].unsqueeze(-1)] += local_matrix[:, i]  # global stiffness matrix

        u = torch.zeros((N, self.n_node, self.n_dim), dtype=torch.float, device=self.device)  # displacement

        u_free = torch.linalg.solve(sys[:, self.free_list][:, :, self.free_list], self.load[self.free_mask].unsqueeze(-1))
        u[:, self.free_mask] = u_free.squeeze()

        TG = torch.einsum('ij,jk->ijk', G, self.T)  # projection coefficient
        tension = torch.sum(TG * (u[:, self.con[:, 1], :] - u[:, self.con[:, 0], :]), dim=-1)
        return u, tension, volume

    def set_discrete_thres(self):
        # set discrete thresholds. if the discrete values are a1, a2, ..., ak, then the thresholds are (a1+a2)/2, (a2+a3)/2, ..., (a1+a2)/2
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

    def set_device(self):
        # change device (CPU/GPU) according to self.device
        for keys, vals in self.__dict__.items():
            if isinstance(vals, torch.Tensor):
                setattr(self, keys, vals.to(self.device))

    def cuda(self):
        # set to GPU
        self.device = 'cuda'
        self.set_device()

    def cpu(self):
        # set to CPU
        self.device = 'cpu'
        self.set_device()

    def denormalize(self, area):
        # convert area from [0,1] to [lb,ub]
        return area * (self.ub - self.lb) + self.lb

    def get_score(self, area):
        # get the score from `area`
        u, tension, volume = self.batch_eval(self.get_solution, area)
        vio_tension = torch.abs(tension) / area / self.max_tension - 1  # tension violation
        penalty_tension = torch.sum(vio_tension * (vio_tension > 0), dim=-1)  # penalty of tension
        vio_dis = torch.abs(u) / self.max_dis - 1  # displacement violation
        penalty_dis = torch.sum(vio_dis * (vio_dis > 0), dim=(-1, -2))  # penalty of displacement
        weight = torch.sum(volume * self.density, dim=-1)
        score = weight * (1 + penalty_tension + penalty_dis) ** 2
        return score, weight, penalty_tension, penalty_dis

    def _func(self, x):
        # construct score/objective function, not intended to be called outside
        self.apply_discrete_thres(x)
        score, *_ = self.get_score(self.denormalize(x))
        return score.view(-1, 1)

    def _func_reverse(self, x):
        # construct reciprocal function, not intended to be called outside
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
            n : int
                number of total output samples
            base: torch.Tensor, size=(1, n_bar), dtype=float64
                base design, based on which new samples are generated
        Returns:
            inputs: torch.Tensor, size=(n, n_bar), dtype=float64
                new input samples, i.e., the areas of bars
        '''
        new_random = base + torch.rand(n, self.n_bar, device=self.device)  # new input data, but only a portion will be adopted
        p = torch.linspace(0, 1, n, device=self.device)  # the ratio of components in a vector that adopts new input data (`new_random`)
        rand = torch.rand_like(new_random)
        mask = rand < p.unsqueeze(-1)  # indicates whether a component will change
        idx = torch.randperm(mask.shape[0])
        mask = mask[idx, :]  # randomly permute the mask
        inputs = base.repeat(n, 1)
        inputs = torch.where(mask, new_random, inputs)
        inputs.masked_fill_(inputs > 1., 1.)
        inputs.masked_fill_(inputs < 0., 0.)
        self.apply_discrete_thres(inputs)
        return inputs


# The following code is not used in the algoritm. It just helps readers to understand how to solve a truss problem.
# It used `set_parameter_10bar` method (go to the method for more instructions).
if __name__ == '__main__':
    truss = Truss()  # build a class
    # since by default Truss uses the 72-bar problem, we need to re-initiate
    truss.set_parameters_10bar()
    truss.pre_compute()
    truss.set_discrete_thres()
    truss.batch_eval = Batch_evaluate(None)
    truss.set_function()
    u, tension, volume = truss.get_solution(torch.ones(1, 10))
    # now it is done

    # the following indicates the relation between this calculation and the one in the matlab repository:
    #   https://www.mathworks.com/matlabcentral/fileexchange/51250-truss-optimization-with-matlab-genetic-algorithm-ga-function
    # If you run `ConstraintsFunc(ones(1,10))` in Matlab, you will get `US` (displacement violation) and `U` (displacement).
    # They are not outputed, so you need to pause in the function. The values are consistent with our calculation
    TS = abs(tension / truss.max_tension) - 1
    U = u
    # If you run `FitnessFunc(ones(1,10))` in Matlab, you will get `WE`
    WE = volume.sum() * truss.density
