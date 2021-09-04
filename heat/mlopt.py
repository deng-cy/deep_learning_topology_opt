# This script mainly builds a class to train the deep neuron network and obtain the optimized solution based on the DNN.

import time

import numpy as np
import scipy.io as scio
import torch
import torch.nn as nn
from torch.utils.data import DataLoader

from ba import ba


class mlopt():
    def __init__(self, filename, node=512, n_block=2):
        self.filename = filename.split('.mat')[0]
        self.data = scio.loadmat(self.filename + '.mat')
        self.img_size1, self.img_size2 = self.data['inputs'].shape[1:]
        self.img_ele = self.img_size1 * self.img_size2

        # DNN changes with the number of loops
        # 1-100 loops
        self.net = nn.Sequential(
            nn.Linear(self.img_ele, node),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node, int(node / 2)),
            nn.Dropout(0.2),
            nn.BatchNorm1d(int(node / 2)),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 2), int(node / 2)),
            nn.Dropout(0.2),
            nn.BatchNorm1d(int(node / 2)),
            nn.Linear(int(node / 2), int(node / 4)),
            nn.BatchNorm1d(int(node / 4)),
            nn.Dropout(0.2),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 4), 1),
        )
        # 101-150 loops
        self.net = nn.Sequential(

            nn.Linear(self.img_ele, node // 2),
            nn.BatchNorm1d(node // 2),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node // 2, node),
            nn.Dropout(0.1),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),

            ### new after 100
            nn.Linear(node, node),
            nn.Dropout(0.1),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node, node),
            nn.Dropout(0.1),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            ###

            nn.Linear(node, int(node / 2)),
            nn.Dropout(0.1),
            nn.BatchNorm1d(int(node / 2)),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 2), int(node / 2)),
            nn.Dropout(0.1),
            nn.BatchNorm1d(int(node / 2)),
            nn.Linear(int(node / 2), int(node / 4)),
            nn.BatchNorm1d(int(node / 4)),
            nn.Dropout(0.1),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 4), 1),
        )

    # a function to preprocess input and output data
    def normalize(self, x, y):
        return x, (y - self.mean_of_y) / self.std_of_y

    # train the DNN
    def train(self, n_epochs=1000, sample_interval=200, lr=0.01, batch_size=1024, n_train=None, decay=1.):
        x = self.data['inputs']
        y = self.data['outputs']
        x = x[:n_train, :, :]
        y = y[:n_train, :]
        self.mean_of_y = np.mean(y)
        self.std_of_y = np.std(y)
        x, y = self.normalize(x, y)

        cuda = True if torch.cuda.is_available() else False

        self.net.train()
        # Loss functions
        loss_fun = nn.MSELoss()
        if cuda:
            self.net.cuda()
            loss_fun.cuda()
        else:
            self.net.cpu()

        # Configure data loader
        FloatTensor = torch.cuda.FloatTensor if cuda else torch.FloatTensor
        tensor_x = FloatTensor(x)
        tensor_y = FloatTensor(y)
        my_dataset = torch.utils.data.TensorDataset(tensor_x, tensor_y)
        drop_last = tensor_y.shape[0] % batch_size == 1  # batch_norm cannot work with one sample, discard the last batch if last_batch.shape[0]=1
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
                imgs = imgs.view(imgs.size(0), self.img_ele)
                # pdb.set_trace()
                prediction = self.net(imgs)
                # pdb.set_trace()
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

        print('epoch', epoch, 'train_loss', loss.data.cpu().numpy())
        time_end = time.time()
        print('Time cost for training', time_end - time_start, 's')

    def test(self, n_train):
        x = self.data['inputs']
        y = self.data['outputs']
        x = x[n_train:, :, :]
        y = y[n_train:, :]
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
        FloatTensor = torch.cuda.FloatTensor if cuda else torch.FloatTensor
        tensor_x = FloatTensor(x)
        tensor_y = FloatTensor(y)
        with torch.no_grad():
            prediction = self.net(tensor_x.flatten(1, 2))
            loss = loss_fun(prediction, tensor_y)

        print('val_loss', loss.data.cpu().numpy())

    # apply BA to the DNN
    def opt(self, filename=None, n=400000, maxiter=1000, seed=1, topk=10, topk_coeff=10, **kwargs):
        # topk_coeff and topk are not useful here
        filename = self.filename + '_opt' if filename == None else filename.split('.mat')[0]

        self.net.eval()
        is_min = False

        time_start = time.time()

        v, s, v_list, *_ = ba(self.net, device=next(self.net.parameters()).device, dim=self.img_ele, n=n, maxiter=maxiter, is_min=is_min, seed=seed,
                              topk=topk * topk_coeff, **kwargs)

        scio.savemat(filename + '.mat',
                     {'base': s.reshape(-1, self.img_size1, self.img_size2).cpu().numpy(), 'prediction': v.item() * self.std_of_y + self.mean_of_y})
        time_end = time.time()
        print('Time cost for optimization', time_end - time_start, 's')


def func(n_train, trainfile, optfile, seed_train, seed_opt, topk=100, node=512, **kwargs):
    # set random seeds
    torch.manual_seed(seed_train)
    torch.cuda.manual_seed(seed_train)
    np.random.seed(seed_train)
    torch.backends.cudnn.deterministic = True

    net1 = mlopt(trainfile, node=node)
    # train a DNN
    net1.train(n_train=n_train, lr=0.001, batch_size=1024, n_epochs=1000, sample_interval=0)
    torch.cuda.empty_cache()  # save memory
    # find the minimum of DNN
    net1.opt(filename=optfile, seed=seed_opt, topk=topk, **kwargs)
