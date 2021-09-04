from ba_lowmem import ba
from truss import Truss
from argparse import ArgumentParser
from utils import get_logger


def main(args):
    truss = Truss(n_node=args.n_node, device='cuda', batch_size=1000)  # change to 1000 if any problem
    logger = get_logger(args)

    logger.info(f'number of variables: {truss.n_bar}')
    v, s, v_list, *_ = ba(func=truss.get_function(), device=truss.device, dim=truss.n_bar, n=args.n_ba, maxiter=args.maxiter, is_min=True,
                          progress=True)

    # log
    [logger.info(f'iteration: {i}, n_train: {(i + 1) * args.n_ba}, current minimum: {v.item()}') for i, v in enumerate(v_list)]


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument("--n_ba", type=int, default=10000, help="number of bats in BA")  # 1000 for 20, 50000 for 228
    parser.add_argument("--maxiter", type=int, default=10, help="number of iterations in BA")
    parser.add_argument("--n_node", type=int, default=100, help="number of nodes")
    parser.add_argument("--log_root", type=str, default='./', help="log file directory")
    parser.add_argument("--log_name", type=str, default='result.log', help="log file name")
    args = parser.parse_args()
    main(args)
