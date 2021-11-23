import logging
import os
import sys

import pandas as pd
import torch


class Batch_evaluate:
    '''
    A class to evaluate a function by several batches to save memory.
    Sometimes out=func(x) requires a large memory to compute, this class devide x into several batches and combine the outputs.
    '''

    def __init__(self, batch_size=None):
        '''
        batch_size: the size of each batch, `None` means starting from x.shape[0]
        '''
        self.batch_size = batch_size

    def __call__(self, func, x):
        '''
        Evaluate a function with automatic batch size.
        Args:
            func: a function or a callable object
            x: input of function `func`

        Returns:
            output of the function `func`, allow multiple outputs

        '''
        while True:
            try:
                if self.batch_size is None:
                    out = func(x)
                else:
                    area_list = x.split(self.batch_size)
                    out_list = [func(area_batch) for area_batch in area_list]
                    if isinstance(out_list[0], torch.Tensor):  # return a single output
                        out = torch.cat(out_list)
                    else:  # return multiple outputs
                        out = tuple([torch.cat(o) for o in zip(*out_list)])
                break
            except RuntimeError as e:
                if 'out of memory' in e.args[0]:
                    if self.batch_size is None:
                        self.batch_size = x.shape[0] // 2
                    else:
                        self.batch_size //= 2
                    print(f'{__name__} out of memory, change batch size to {self.batch_size}')
                else:
                    raise e
        return out


def get_logger(args):
    logger = logging.getLogger(__name__)
    file_handler = logging.FileHandler(os.path.join(args.log_root, args.log_name), mode='w')
    file_handler.setLevel(logging.INFO)
    logger.addHandler(file_handler)  # comment this out if you do not want log file
    print_handler = logging.StreamHandler(sys.stdout)
    print_handler.setLevel(logging.DEBUG)
    logger.addHandler(print_handler)
    logger.setLevel(logging.DEBUG)

    return logger


def unique(inputs, number=None):
    """
    Select top `number` unique vectors.
    torch.unique has multiple weird behaviors, such as
    (1) not able to return tensors based on occurence (must be sorted),
    (2) two close float tensors are regarded as the same (so one of them will be eliminated), sometimes different
    Therefore, we use this function to select unique tensors and maintain occurrence.
    Args:
        inputs: torch.Tensor, size = (dim1, n_bar)
            input vectors
        number: int
            number of unique tensors needed

    Returns:
        out: torch.Tensor, size = (number, n_bar)

    """
    inputs_unique, idx = torch.unique(inputs, return_inverse=True, dim=0)
    idx_unique = pd.unique(idx.cpu().numpy())
    out = inputs_unique[idx_unique[:number]]
    return out
