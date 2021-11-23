# reference: https://github.com/Sanbongawa/binary_swarm_intelligence

import math

import torch
import tqdm


@torch.no_grad()
def bba(func, x0=None, n=200, maxiter=2000, topk=100, is_min=True, fmin=0, fmax=2, loud_A=0.25, r0=0.4, alpha=0.999, gamma=10., progress=False):
    """
    Binary Bat Algorithm
    input:{ func: Evaluate_Function, type is nn.Module
            x0: initial guess of the solution
            n: Number of population
            maxiter: Number of max iteration
            topk: the number of states to output (see output best_s_list)
            is_min: minimizing (True) or maximizing (False) func
            fmin: a hyperparamter, frequency minimum to step
            fmax: a hyperparamter, frequency maximum to step
            loud_A: a hyperparamter, value of Loudness
            r0: a hyperparamter, pulse rate, Probability to relocate near the best position
            alpha: a hyperparamter, decay rate of loud_A
            gamma: a hyperparamter, decay rate of gamma
            progress: whether to show progress par
            }
    output:{best_v: Best value, type torch.tensor(2.22)
            best_s: Best state, type torch.tensor([1.,0.,0.,1.,.....])
            best_s_list: best topk states
            best_v_list: len=maxiter, observed best value in each iteration
            }
    """

    device = next(func.parameters()).device  # get device(CPU/GPU) from `func`
    dim = x0.shape[1]

    # initialize
    v = torch.zeros(n, dim, device=device)
    x = torch.rand(n - 1, dim)
    x = (x > 0.9).type_as(x0)  # convert to binary
    x = torch.cat([x, x0], dim=0)

    fit = func(x) if is_min else -func(x)
    min_fit = fit.min()
    best_v = min_fit
    best_s = x[fit.argmin()].reshape((1, -1))
    best_v_list = []

    if progress:
        m = tqdm.tqdm(range(maxiter))
    else:
        m = range(maxiter)
    for t in m:

        # update parameters
        r = r0 * (1 - torch.exp(torch.tensor(-gamma * t, device=device)))
        loud_A *= alpha

        freq = fmin + (fmin - fmax) * torch.rand(n, device=device).reshape((-1, 1))
        v += (x - best_s) * freq
        vstf = torch.abs((2. / math.pi) * torch.atan((math.pi / 2) * v))

        x_new = x.clone()

        # flip
        accept = torch.rand(n, dim, device=device) < vstf + 1 / 160
        # TODO: I made a mistake here, `160` above should be `dim` to match the paper (although I do not think it matters).
        #  I kept this mistake to help repeat my result, but you can change it for new problems
        x_new[accept] = 1. - x_new[accept]

        # accept local optimum
        accept = torch.rand(n, dim, device=device) > r
        x_new[accept] = best_s.expand(n, dim)[accept]

        fit_new = func(x_new) if is_min else -func(x_new)

        # accept new solutions
        rand = torch.rand(n, device=device)
        accept = (fit_new <= fit).view_as(rand) & (rand < loud_A)

        x[accept, :] = x_new[accept, :]
        fit[accept] = fit_new[accept]

        # update best solution
        min_fit, argmin_f = fit.min(0)
        if min_fit < best_v:
            best_s = x[argmin_f].reshape((1, -1)).clone()
            best_v = min_fit.clone()

        best_v_list.append(best_v if is_min else - best_v)

    # postprcess, get ready to output
    best_s_list = torch.unique(torch.cat((fit, x), dim=1), dim=0)[0:topk, :]  # delete repeated solutions

    return (best_v if is_min else - best_v), best_s, best_s_list, best_v_list
