# https://github.com/Sanbongawa/binary_swarm_intelligence

import math

import torch
import tqdm


def bba(func, x0=None, n=200, maxiter=2000, topk=100, fmin=0, fmax=2, loud_A=0.25, r0=0.4, min=True, alpha=0.999, gamma=10., progress=False):
    """
    input:{ func: Evaluate_Function, type is nn.Module
            n: Number of population, default=20
            m_i: Number of max iteration, default=300
            minf: minimazation flag, default=0, 0=maximization, 1=minimazation
            dim: Number of feature, default=None
            prog: Do you want to use a progress bar?, default=False
            fmin: frequency minimum to step
            fmax: frequency maximum to step
            loud_A: value of Loudness, default=0.25
            r0: Pulse rate, default=0.4, Probability to relocate near the best position
            }
    output:{best_v: Best value, type torch.tensor(2.22)
            best_s: Best state, type torch.tensor([1.,0.,0.,1.,.....])
            best_s_list: best topk states
            best_v_list: len=maxiter, observed best value in each iteration
            }
    """

    device = next(func.parameters()).device
    dim = x0.shape[1]

    v = torch.zeros(n, dim, device=device)

    x = torch.rand(n - 1, dim)
    x = (x > 0.9).type_as(x0)
    x = torch.cat([x, x0], dim=0)

    torch.set_grad_enabled(False)
    fit = func(x) if min else -func(x)
    min_fit = fit.min()
    best_v = min_fit
    best_s = x[fit.argmin()].reshape((1, -1))
    best_list = []

    T = 0.1

    if progress:
        m = tqdm.tqdm(range(maxiter))
    else:
        m = range(maxiter)
    for t in m:

        r = r0 * (1 - torch.exp(torch.tensor(-gamma * t, device=device)))
        loud_A *= alpha

        freq = fmin + (fmin - fmax) * torch.rand(n, device=device).reshape((-1, 1))
        v += (x - best_s) * freq
        vstf = torch.abs((2. / math.pi) * torch.atan((math.pi / 2) * v))

        x_new = x.clone()

        # flip
        accept = torch.rand(n, dim, device=device) < vstf + 1 / 160
        x_new[accept] = 1. - x_new[accept]

        # local opt
        accept = torch.rand(n, dim, device=device) > r
        x_new[accept] = best_s.expand(n, dim)[accept]

        fit_new = func(x_new) if min else -func(x_new)

        # accept new solutions
        rand = torch.rand(n, device=device)
        accept = (fit_new <= fit).view_as(rand) & (rand < loud_A)

        x[accept, :] = x_new[accept, :]
        fit[accept] = fit_new[accept]

        min_fit, argmin_f = fit.min(0)

        if min_fit < best_v:
            best_s = x[argmin_f].reshape((1, -1)).clone()
            best_v = min_fit.clone()

        T *= 0.999
        best_list.append(best_v)

    best_s_list = torch.unique(torch.cat((fit, x), dim=1), dim=0)[0:topk, :]

    return best_v, best_s, best_s_list, best_list
