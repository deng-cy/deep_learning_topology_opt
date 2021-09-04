# This script mainly builds a class to train the deep neuron network and obtain the optimized solution based on the DNN.

import time
import numpy as np
import scipy.io as scio
import torch
import torch.nn as nn
from bba import bba
from torch.utils.data import DataLoader


class mlopt():
    def __init__(self, filename, node=512):
        self.filename = filename.split('.mat')[0]
        self.data = scio.loadmat(self.filename + '.mat')
        self.img_size1, self.img_size2 = self.data['inputs'].shape[1:]
        self.img_ele = self.img_size1 * self.img_size2
        # building the DNN
        self.net = nn.Sequential(
            nn.Linear(self.img_ele, node),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node, int(node / 2)),
            nn.Dropout(0.4),
            nn.BatchNorm1d(int(node / 2)),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 2), int(node / 4)),
            nn.BatchNorm1d(int(node / 4)),
            nn.Dropout(0.4),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node / 4), 1),
        )

    # a function to preprocess input and output data
    def normalize(self, x, y):
        return x, (y - self.mean_of_y) / self.std_of_y

    # train the DNN
    def train(self, n_epochs=1000, sample_interval=200, lr=0.01, batch_size=1024, n_train=None, decay=1):
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
        optimizer = torch.optim.Adam(self.net.parameters(), lr=lr)
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

        print('epoch', epoch, 'train_loss', loss.data.cpu().numpy())
        time_end = time.time()
        print('Time cost for training', time_end - time_start, 's')

    # apply BBA to the DNN
    def opt(self, filename=None, n=100000, maxiter=1000, seed=1, topk=10, topk_coeff=10, **kwargs):
        # topk_coeff: we need more samples to pull from BBA, since repeated ones will be deleted
        filename = self.filename + '_opt' if filename == None else filename.split('.mat')[0]
        torch.manual_seed(seed)
        torch.cuda.manual_seed(seed)

        self.net.eval()
        is_min = False

        time_start = time.time()
        x0 = torch.zeros((1, self.img_ele)).cuda() if torch.cuda.is_available() else torch.zeros((1, self.img_size1 * self.img_size2))

        v, s, top_list, v_list = bba(self.net, x0=x0, n=n, maxiter=maxiter, is_min=is_min, topk=topk * topk_coeff, **kwargs)

        top_np = top_list[:, 1:].cpu().numpy().reshape(-1, self.img_ele).astype(dtype='uint8')
        x = self.data['inputs'].reshape(-1, self.img_ele).astype(dtype='uint8')
        x_view = x.view([('', x.dtype)] * x.shape[1])
        top_np_view = top_np.view([('', top_np.dtype)] * x.shape[1])
        uniq_topk = np.setdiff1d(top_np_view, x_view, assume_unique=True).view(top_np.dtype).reshape(-1, x.shape[1])
        topk_np = uniq_topk[:topk]
        v = v.item() * self.std_of_y + self.mean_of_y if is_min else -v.item() * self.std_of_y + self.mean_of_y
        prediction = top_list[:, 0].cpu().numpy().reshape(-1, 1) * self.std_of_y + self.mean_of_y if is_min else -top_list[:, 0].cpu().numpy().reshape(-1,
                                                                                                                                                       1) * self.std_of_y + self.mean_of_y
        scio.savemat(filename + '.mat', {'base': topk_np.reshape(-1, self.img_size1, self.img_size2), 'prediction': prediction})
        time_end = time.time()
        print('Time cost for optimization', time_end - time_start, 's')
        print("global minimum: xmin = {0}, \n f(xmin) = {1:.6f}".format(s.cpu().numpy().reshape(self.img_size1, self.img_size2), v.item() * self.std_of_y + self.mean_of_y))


def func(n_train, trainfile, optfile, seed_train, seed_opt, topk=100, node=512, **kwargs):
    # set random seeds
    torch.manual_seed(seed_train)
    torch.cuda.manual_seed(seed_train)
    np.random.seed(seed_train)
    torch.backends.cudnn.deterministic = True

    net1 = mlopt(trainfile, node=node)
    net1.train(n_train=n_train, lr=0.01, batch_size=1024, n_epochs=1000, sample_interval=0)
    torch.cuda.empty_cache()
    net1.opt(filename=optfile, seed=seed_opt, topk=topk, **kwargs)
