import torch
import tqdm


@torch.no_grad()
def ba(func, dim=100, n=200, maxiter=2000, is_min=True, topk=100, topk_coef=10, fmin=0, fmax=1, loud_A=0.95, r0=0.85, alpha=0.999, gamma=0.1,
       w_init=0.2, w_final=0.9, n_batch=1, seed=None, progress=False, device=None, low_mem=False):
    # TODO: I made a mistake here. The paper "A new modification approach on bat algorithm for solving optimization problems" suggests
    #  w_init=0.9 and w_final=0.2. I used wrong numbers. I kept this mistake to help repeat my result, but you can change it for new problems
    """
    Bat Algorithm, low memory version
    input:{ func: Evaluate_Function, type is nn.Module
            dim: number of features
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
            w_init: a hyperparamter, initial inertia
            w_final: a hyperparamter, final inertia
            seed: random seed
            progress: whether to show progress par
            device: 'cpu' or 'cuda', device on which this algorithm operates
            n_batch: number of batches to calculate func(x), sometimes >1 if memory is not enough to calculate all at once,
            low_mem: True/False, whether to use low memory mode (i.e., using float16 rather than float32)
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
    if low_mem:  # compress data type
        dtype = torch.float16
        if isinstance(func, torch.nn.Module):
            func.half()
    else:
        dtype = None

    assert n % n_batch == 0
    n_per_batch = n // n_batch

    # initialize
    v = torch.zeros(n, dim, device=device, dtype=dtype)
    x = torch.rand(n, dim, device=device, dtype=dtype)

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

        # update parameters
        r = r0 * (1. - torch.exp(torch.tensor(-gamma * t, device=device)))
        loud_A *= alpha
        w = (1 - t / maxiter) ** 2 * (w_init - w_final) + w_final

        freq = fmin + (fmin - fmax) * torch.rand(n, device=device).reshape((-1, 1))
        v *= w

        for i in range(n_batch):
            v[i * n_per_batch:(i + 1) * n_per_batch] += (x[i * n_per_batch:(i + 1) * n_per_batch] - best_s) * freq[
                                                                                                              i * n_per_batch:(i + 1) * n_per_batch]

            # update based on velocity
            x_new = x[i * n_per_batch:(i + 1) * n_per_batch] + v[i * n_per_batch:(i + 1) * n_per_batch]

            # improve the best solution
            accept: torch.Tensor = torch.rand(n_per_batch, dim, device=device, dtype=dtype) > r
            x_new = torch.where(accept, best_s.expand(n_per_batch, dim) + loud_A * torch.randn(n_per_batch, dim, device=device, dtype=dtype), x_new)

            # adjust bound
            x_new.masked_fill_(x_new > 1., 1.)
            x_new.masked_fill_(x_new < 0., 0.)

            fit_new = func(x_new) if is_min else -func(x_new)

            # accept new solutions
            rand = torch.rand(n_per_batch, 1, device=device, dtype=dtype)
            accept = (fit_new <= fit[i * n_per_batch:(i + 1) * n_per_batch]).view_as(rand) & (rand < loud_A)
            x[i * n_per_batch:(i + 1) * n_per_batch] = torch.where(accept.expand(n_per_batch, dim), x_new, x[i * n_per_batch:(i + 1) * n_per_batch])
            fit[i * n_per_batch:(i + 1) * n_per_batch] = torch.where(accept, fit_new, fit[i * n_per_batch:(i + 1) * n_per_batch])

        # update best solution
        min_fit, argmin_f = fit.min(0)
        if min_fit < best_v:
            best_s = x[argmin_f].reshape((1, -1)).clone()
            best_v = min_fit.clone()

        best_v_adj = best_v if is_min else - best_v
        best_v_list.append(best_v_adj)

        if progress == True:
            m.set_description(f'current optimum {best_v_adj.item():.4e}')

    # postprcess, get ready to output
    idx = fit.squeeze().argsort()[:topk * topk_coef]
    best_s_list = torch.unique(torch.cat((fit[idx], x[idx]), dim=1), dim=0)[0:topk, 1:]  # delete repeated solutions
    best_v_list = torch.cat(best_v_list)

    if low_mem:  # convert back data type
        dtype = torch.float32
        best_v = best_v.type(dtype)
        best_s = best_s.type(dtype)
        best_v_list = best_v_list.type(dtype)
        best_s_list = best_s_list.type(dtype)
        if isinstance(func, torch.nn.Module):
            func.float()

    return (best_v if is_min else - best_v), best_s, best_v_list, best_s_list
