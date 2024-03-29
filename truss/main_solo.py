import distutils.util
import os
from argparse import ArgumentParser

import torch

from mlopt import Mlopt
from truss import Truss
from utils import unique, get_logger, Batch_evaluate


def main(args):
    os.makedirs(args.log_root, exist_ok=True)
    logger = get_logger(args)

    truss = Truss(n_node=args.n_node, device='cuda')
    logger.info(f'number of variables: {truss.n_bar}')
    func = truss.get_function(inverse=True)
    batch_eval = Batch_evaluate()
    inputs = torch.rand(args.n_0 * args.topk_coef, truss.n_bar, device=truss.device)
    truss.apply_discrete_thres(inputs)
    inputs = unique(inputs, args.n_0)
    outputs = func(inputs)
    net = Mlopt(inputs, outputs, device=truss.device, node=args.node, truss=truss)
    n_greedy = max(int(args.n * args.ratio_greedy), 1)
    n_regular = args.n - n_greedy

    for i in range(args.n_iter):
        n_old = args.n_0 + args.n * i
        net.train(lr=0.001, batch_size=1024, n_epochs=1000, sample_interval=0)  # train DNN
        base, prediction, inputs_g, v_list = net.opt(n=args.n_ba, maxiter=args.maxiter, seed=None, is_min=False, topk=n_greedy * args.topk_coef,
                                                     low_mem=args.low_mem)  # perform BA optimization

        inputs = unique(torch.cat([inputs, inputs_g]), n_old + n_greedy)  # generate new samples based on old & greedy (best ones from DNN)
        if n_regular > 0:
            inputs_r = truss.generate_input(n_regular * args.topk_coef, base)  # generate new samples for regular (by disturbance)
            inputs = unique(torch.cat([inputs, inputs_r]), n_old + args.n)

        # compute objective values
        outputs_new = func(inputs[n_old:])
        outputs = torch.cat([outputs, outputs_new])

        # because of weird behavior of torch.unique (see more in unique function in utils.py), sometimes inputs and outputs are mismatched
        temp_out = batch_eval(func, inputs)
        try:
            if (temp_out != outputs).any():
                outputs = temp_out
                logger.error('adjust outputs')
        except Exception as e:
            logger.error(e)
            outputs = temp_out
            logger.error('adjust outputs')

        net.update_data(inputs, outputs)

        ######## log ########

        logger.info(
            f'iteration: {i}, n_train: {n_old + args.n}, '
            f'current minimum: {1 / outputs.max().item():.1f}, '
            f'prediction: {1 / prediction.item():.1f}, truth: {1 / outputs_new[0].item():.1f}'
        )

        if args.save_data_interval > 0 and (i % args.save_data_interval or i == args.n_iter - 1) == 0:
            torch.save(inputs, os.path.join(args.log_root, f"{args.log_name.split('.')[0]}_inputs.pt"))


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument("--n_iter", type=int, default=10, help="number of iterations/loops")
    parser.add_argument("--n", type=int, default=10, help="number of additional training data per iteration")
    parser.add_argument("--ratio_greedy", type=float, default=0.1,
                        help="ratio of greedy data (from BA), the rest (1-ratio_greedy) will be generated by disturbance")
    parser.add_argument("--n_0", type=int, default=100, help="number of initial training data")
    parser.add_argument("--log_root", type=str, default='./', help="log file directory")
    parser.add_argument("--log_name", type=str, default='result.log', help="log file name")
    parser.add_argument("--save_data_interval", type=int, default=0, help="save torch tensors every certain loops, 0 means no saving")
    parser.add_argument("--n_node", type=int, default=20, help="number of nodes in the truss")
    parser.add_argument("--node", type=int, default=1024, help="number of neurons in first DNN")
    parser.add_argument("--low_mem", type=distutils.util.strtobool, default=True,
                        help="whether to use low memory mode of BA (float16 instead of default float32)")
    parser.add_argument("--topk_coef", type=int, default=10,
                        help="when extracting data from BA/disturbance, more data (topk_coef*original) is needed in case some will be removed because they're repeated")
    parser.add_argument("--n_ba", type=int, default=500000, help="number of bats in BA")
    parser.add_argument("--maxiter", type=int, default=100, help="number of iterations in BA")
    args = parser.parse_args()
    main(args)
