import numpy as np
import optuna
import matlab.engine
import time
import scipy.io as scio
import multiprocessing as mp
import pickle
import logging
# define some global variables
# total_cycle = 1000
# cycle_per_step = 50
n_trails = 20000
study_name = 'cmaes_fine'
storage = 'sqlite:///cmaes_fine.db'
# storage=None


names = matlab.engine.find_matlab()
engs = []
for name in names:
    engs.append(matlab.engine.connect_matlab(name))
num_worker = len(names)
time_start=time.time()
# mask_x=np.ones((5,1))
# mask_x[0,0]=0.5
# mask_x[-1,0]=0.5
# mask_y=np.ones((1,5))
# mask_y[0,0]=0.5
# mask_y[0,-1]=0.5;
# mask=mask_x@mask_y*0.25**2
# mask=mask.reshape(-1)
eng=engs[0]

# define study (the job for each worker)

def objective(trial):
    variables=[]
    for i in range(121):
        variable=trial.suggest_uniform(f'var{i}', 0.,1.)
        variables.append(float(variable))
    energy=eng.func_python_api(variables)

    # energy=np.std(np.array(variables))
    return energy
    


if __name__ == '__main__':
    if num_worker==0:
        print('Error: no Matlab worker detected')
    else:
        print('Number of worker(s): {:d}'.format(num_worker))

    try:
        optuna.study.delete_study(study_name, storage)
    except:
        pass

    study = optuna.create_study(study_name=study_name,
                                storage=storage,
                                direction='minimize',
                                sampler=optuna.samplers.CmaEsSampler(seed=0)
                                )
    # study=optuna.load_study(study_name=study_name,storage=storage)
    study.optimize(objective, n_trials=n_trails)
    y_list=optuna.visualization.plot_optimization_history(study)['data'][0]['y']
    scio.savemat('data_cmaes.mat',{'y': y_list})


