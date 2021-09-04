import time

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.data import DataLoader

from ba_lowmem import ba
from utils import Batch_evaluate


class Block(nn.Module):
    def __init__(self, in_feat=128, out_feat=128, dropout=0.2):
        super().__init__()
        self.model = nn.Sequential(
            nn.Linear(in_feat, out_feat),
            nn.BatchNorm1d(out_feat),
            nn.LeakyReLU(0.2),
            nn.Dropout(dropout),
            nn.Linear(out_feat, in_feat),
            nn.BatchNorm1d(out_feat),
        )

    def forward(self, x):
        out = self.model(x)
        out = F.relu(out + x)
        return out


class Net(nn.Module):
    def __init__(self, truss=None, dim=0, node=512, n_block=1, dropout=0.1):
        super().__init__()
        self.truss = truss
        self.batch_eval = Batch_evaluate()
        blk = []
        for _ in range(n_block):
            blk.append(Block(node, node, dropout=dropout))
        self.net = nn.Sequential(
            nn.Linear(dim, node),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Dropout(dropout),
            *blk,
            nn.Linear(node, node // 2),
            nn.BatchNorm1d(node // 2),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node // 2, 1),
        )

    def forward(self, x):
        if self.training:
            return self.net(x)
        else:
            self.truss.apply_discrete_thres(x)
            return self.batch_eval(self.net, x)


class Mlopt():
    def __init__(self, x, y, node=512, n_block=1, device='cpu', truss=None):
        self.x = x
        self.y = y
        self.img_ele = self.x.shape[1]
        self.device = device

        self.n_batch = 1

        self.net = Net(node=node, truss=truss, dim=self.img_ele, n_block=n_block)

    # a function to preprocess input and output data
    def normalize(self, x, y):
        return x, (y - self.mean_of_y) / self.std_of_y

    def update_data(self, x, y):
        self.x = x
        self.y = y

    # train the DNN
    def train(self, n_epochs=1000, sample_interval=200, lr=0.01, batch_size=1024, n_train=None, decay=1.):
        x = self.x[:n_train, :]
        y = self.y[:n_train, :]
        self.mean_of_y = torch.mean(y)
        self.std_of_y = torch.std(y)
        x, y = self.normalize(x, y)

        self.net.train()

        # Loss functions
        loss_fun = nn.MSELoss()

        self.net.to(self.device)
        loss_fun.to(self.device)

        # Configure data loader
        my_dataset = torch.utils.data.TensorDataset(x, y)
        drop_last = y.shape[0] % batch_size == 1  # batch_norm cannot work with one sample, discard the last batch if last_batch.shape[0]=1
        dataloader = torch.utils.data.DataLoader(my_dataset, batch_size=batch_size, shuffle=True, drop_last=drop_last)

        # Optimizers
        optimizer = torch.optim.AdamW(self.net.parameters(), lr=lr)
        lr_lambda = lambda epoch: decay ** epoch
        scheduler = torch.optim.lr_scheduler.LambdaLR(optimizer, lr_lambda=lr_lambda)

        # ----------
        #  Training
        # ----------
        time_start = time.time()

        for epoch in range(n_epochs):
            for i, (imgs, labels) in enumerate(dataloader):
                #
                prediction = self.net(imgs)
                optimizer.zero_grad()
                loss = loss_fun(prediction, labels)
                loss.backward()
                optimizer.step()
                scheduler.step()

            if sample_interval > 0 and epoch % sample_interval == 0:
                print('epoch', epoch, 'train_loss', loss.data.cpu().numpy())
                time_end = time.time()
                print('time cost', time_end - time_start, 's')
                self.test(n_train)
        if sample_interval >= 0:
            print('epoch', epoch, 'train_loss', loss.data.cpu().numpy())
            time_end = time.time()
            print('Time cost for training', time_end - time_start, 's')

    def test(self, n_train):
        x = self.x[n_train:, :]
        y = self.y[n_train:, :]
        x, y = self.normalize(x, y)
        cuda = True if torch.cuda.is_available() else False

        self.net.eval()
        # Loss functions
        loss_fun = nn.MSELoss()
        if cuda:
            self.net.cuda()
            loss_fun.cuda()
        else:
            self.net.cpu()

        with torch.no_grad():
            prediction = self.net(x)
            loss = loss_fun(prediction, y)

        print('val_loss', loss.data.cpu().numpy())

    # apply BA to the DNN
    def opt(self, n=500000, maxiter=2000, seed=None, topk=10, is_min=True, print_time=True, **kwargs):
        # topk_coeff: we need more samples to pull from BBA, since repeated ones will be deleted

        self.net.eval()

        time_start = time.time()

        while True:
            try:
                v, s, v_list, best_s_list = ba(self.net, device=next(self.net.parameters()).device, dim=self.img_ele, n=n, maxiter=maxiter,
                                               is_min=is_min,
                                               seed=seed, n_batch=self.n_batch,
                                               topk=topk, **kwargs)
                break
            except Exception as e:
                if 'out of memory' in e.args[0]:
                    self.n_batch += 1
                    while n % self.n_batch > 0:
                        self.n_batch += 1
                    print(f'{__name__} out of memory, change number of batches to {self.n_batch}')
                else:
                    raise e
        if print_time:
            time_end = time.time()
            print('Time cost for optimization', time_end - time_start, 's')
        return s, v * self.std_of_y + self.mean_of_y, best_s_list, v_list * self.std_of_y + self.mean_of_y
