import numpy as np
import optuna
import matlab.engine
import time
import scipy.io as scio

from scipy.optimize import dual_annealing


names = matlab.engine.find_matlab()
engs = []
for name in names:
    engs.append(matlab.engine.connect_matlab(name))
num_worker = len(names)
time_start = time.time()
eng = engs[0]

if __name__ == '__main__':
    ratio=0.5
    mask_x=np.ones((5,1))
    mask_x[0,0]=0.5
    mask_x[-1,0]=0.5
    mask_y=np.ones((1,5))
    mask_y[0,0]=0.5
    mask_y[0,-1]=0.5
    mask=mask_x@mask_y*0.25**2
    mask=mask.reshape(-1)
    img_ele=25
    lw = [0.] * img_ele
    up = [1.] * img_ele
    bound = list(zip(lw, up))
    count = 0
    y_list=[]

    def func_uncon(x):
        global count
        count += 1
        y = eng.func_python_api(x.tolist())
        print(f'count={count}, y={y:.4f}')
        y_list.append(y)
        return y


    time_start = time.time()

    ret = dual_annealing(func_uncon, bounds=list(zip(lw, up)), seed=0, maxiter=100000, maxfun=2000)

    scio.savemat('data_gsa.mat', {'y': y_list})