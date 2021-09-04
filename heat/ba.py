import torch
import tqdm


@torch.no_grad()
def ba(func, dim=100, n=200, maxiter=2000, is_min=True, topk=100, fmin=0, fmax=1, loud_A=0.95, r0=0.85, alpha=0.999, gamma=0.1, w_init=0.9,
       w_final=0.2, seed=None, progress=False, device=None):
    """
    input:{ func: Evaluate_Function, type is nn.Module
            dim: number of features
            n: Number of population, default=20
            maxiter: Number of max iteration, default=300
            topk: the number of states to output (see output best_s_list)
            is_min: minimizing (True) or maximizing (False) func
            fmin: a hyperparamter, frequency minimum to step
            fmax: a hyperparamter, frequency maximum to step
            loud_A: a hyperparamter, value of Loudness, default=0.25
            r0: a hyperparamter, pulse rate, Probability to relocate near the best position
            alpha: a hyperparamter, decay rate of loud_A
            gamma: a hyperparamter, decay rate of gamma
            w_init: a hyperparamter, initial intertia
            w_final: a hyperparamter, final intertia
            seed: random seed
            progress: whether to show progress par
            device: 'cpu' or 'cuda', device on which this algorithm operates
            }
    output:{best_v: Best value, type torch.tensor(2.22)
            best_s: Best state, type torch.tensor([1.,0.,0.,1.,.....])
            best_s_list: best topk states
            best_v_list: len=maxiter, observed best value in each iteration
            }
    """
    if seed is not None:
        torch.manual_seed(seed)
        torch.cuda.manual_seed(seed)
    if device is None:
        device = next(func.parameters()).device
    v = torch.zeros(n, dim, device=device)

    x = torch.rand(n, dim, device=device)

    fit = func(x) if is_min else -func(x)
    min_fit = fit.min(0)[0]
    best_v = min_fit
    best_s = x[fit.argmin()].reshape((1, -1))
    best_v_list = []

    if progress:
        m = tqdm.tqdm(range(maxiter))
    else:
        m = range(maxiter)
    for t in m:

        r = r0 * (1. - torch.exp(torch.tensor(-gamma * t, device=device)))
        loud_A *= alpha
        w = (1 - t / maxiter) ** 2 * (w_final - w_init) + w_init

        freq = fmin + (fmin - fmax) * torch.rand(n, device=device).reshape((-1, 1))
        v *= w
        v += (x - best_s) * freq

        # update based on velocity
        x_new = x + v

        # improve the best solution
        accept: torch.Tensor = torch.rand(n, dim, device=device) > r
        x_new = torch.where(accept, best_s.expand(n, dim) + 0.001 * torch.randn(n, dim, device=device), x_new)

        # adjust bound
        x_new.masked_fill_(x_new > 1., 1.)
        x_new.masked_fill_(x_new < 0., 0.)

        fit_new = func(x_new) if is_min else -func(x_new)

        # accept new solutions
        rand = torch.rand(n, 1, device=device)
        accept = (fit_new <= fit).view_as(rand) & (rand < loud_A)

        x = torch.where(accept.expand(n, dim), x_new, x)
        fit = torch.where(accept, fit_new, fit)

        min_fit, argmin_f = fit.min(0)

        if min_fit < best_v:
            best_s = x[argmin_f].reshape((1, -1)).clone()
            best_v = min_fit.clone()

        best_v_list.append(best_v if is_min else - best_v)

    best_s_list = torch.unique(torch.cat((fit, x), dim=1), dim=0)[0:topk, 1:]

    return (best_v if is_min else - best_v), best_s, best_v_list, best_s_list
