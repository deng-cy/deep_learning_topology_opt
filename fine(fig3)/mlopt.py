#This script mainly builds a class to train the deep neuron network and obtain the optimized solution based on the DNN. 

import os
import numpy as np
import math
import scipy.io as scio
from scipy.optimize import dual_annealing

from torch.utils.data import DataLoader
from torchvision import datasets
from torch.autograd import Variable

import torch.nn as nn
import torch.nn.functional as F
import torch


import time



class mlopt():
    def __init__(self, filename, ratio,node=512):
        self.filename=filename.split('.mat')[0]     
        self.data = scio.loadmat(self.filename+'.mat')
        self.mask = self.data['mask']

        self.ratio=ratio
        self.img_size1, self.img_size2=self.mask.shape
        self.img_ele=self.img_size1*self.img_size2
        # building the DNN
        self.net=nn.Sequential(
            nn.Linear(self.img_ele, node),
            nn.BatchNorm1d(node),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(node,int(node/2)),
            nn.Dropout(0.4),
            nn.BatchNorm1d(int(node/2)),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node/2), int(node/4)),
            nn.BatchNorm1d(int(node/4)),
            nn.Dropout(0.4),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Linear(int(node/4), 1),
        )
    # a function to preprocess input and output data
    def normalize(self,x,y):
        return x*2-1., (y-self.mean_of_y)/self.std_of_y

    #train the DNN
    def train(self,n_epochs=1000,write=True,sample_interval=200,lr=0.01,batch_size=1024,n_train=None,decay=1):
        x = self.data['inputs']
        y = self.data['outputs']
        x=x[:n_train,:,:]
        y=y[:n_train,:]
        self.mean_of_y=np.mean(y)
        self.std_of_y=np.std(y)
        x,y=self.normalize(x,y)
        
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
        dataloader = torch.utils.data.DataLoader(my_dataset, batch_size=batch_size,shuffle=True)
    
        # Optimizers
        optimizer = torch.optim.Adam(self.net.parameters(), lr=lr)
        lr_lambda = lambda epoch: decay ** epoch
        scheduler = torch.optim.lr_scheduler.LambdaLR(optimizer, lr_lambda=lr_lambda)
    
        # ----------
        #  Training
        # ----------
        time_start=time.time()
        
        for epoch in range(n_epochs):
            for i, (imgs, labels) in enumerate(dataloader):
                #
                labels = Variable(labels)
                imgs = imgs.view(imgs.size(0),self.img_ele)
                imgs=Variable(imgs)
                #pdb.set_trace()
                prediction = self.net(imgs)
                #pdb.set_trace()
                optimizer.zero_grad()
                loss = loss_fun(prediction, labels)
                loss.backward()
                optimizer.step()
                scheduler.step()
    
            if epoch % sample_interval == 0:
                print('epoch',epoch,'train_loss',loss.data.cpu().numpy())
                time_end=time.time()
                print('time cost',time_end-time_start,'s')
    
        print('epoch',epoch,'train_loss',loss.data.cpu().numpy())
        time_end=time.time()
        print('Time cost for training',time_end-time_start,'s')

    #apply GSA to the DNN
    def opt_anneal(self,c=1000,filename=None,ratio=None,maxiter=1000,seed=123):
        filename=self.filename+'_opt' if filename==None else filename.split('.mat')[0]
        if ratio==None: ratio=self.ratio
        mask=np.reshape(self.mask,self.img_ele,-1)  
        lw = [-1.] * self.img_ele
        up = [1.] * self.img_ele
        bound=list(zip(lw, up))
        count=0
        self.net.eval()
        self.net.cpu()
        x_out=np.zeros((1,self.img_size1,self.img_size2))
        local_opt=[]
        def func_ori(x):
            FloatTensor=torch.FloatTensor
            x=FloatTensor(x)
            prediction=self.net(x.unsqueeze(0))
            return prediction.detach().numpy()[0,0]

        def func_uncon(x):
            nonlocal count
            count+=1
            return (sum(np.multiply((x+1)/2.,mask))-ratio)**2*c-func_ori(x)
        
        def record(x,f,context):
            local_opt.append((x+1)/2)
            
        time_start=time.time()      
        ret = dual_annealing(func_uncon, bounds=list(zip(lw, up)), seed=seed,maxiter=maxiter,maxfun=1e10,callback=record)
        x_out[0,:,:]=(np.reshape(ret.x,(self.img_size1,self.img_size2))+1)/2 #unnormalize
        
        scio.savemat(filename+'.mat', {'base':x_out,'prediction':-ret.fun*self.std_of_y+self.mean_of_y})

        time_end=time.time()
        print('Time cost for Opt_anneal',time_end-time_start,'s')
        print("global minimum: xmin = {0}, f(xmin) = {1:.6f}".format(ret.x, -ret.fun*self.std_of_y+self.mean_of_y))
        print(count)
        return ret
    
def func(n,optfile,seed_train,seed_opt,trainfile=''):

    #set random seeds
    torch.manual_seed(seed_train)
    torch.cuda.manual_seed(seed_train)
    np.random.seed(seed_train)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False

    #build a class instance to train the neuron network and get the optimized solution 
    net1=mlopt(trainfile,0.5,node=512)
    net1.train(n_train=n,lr=0.01,batch_size=1024)
    net1.opt_anneal(filename=optfile,seed=seed_opt)