# Truss optimization problem with 72, 432, or 1008 variables

## Software environment

* Python 3.7
    * PyTorch 1.8.0

Note that minimum PyTorch version is different from other examples, since we need `torch.kron` (in `truss.py`). You can write your own if you use a
lower version.

## Code

Main files:

* <strong>main_solo.py</strong>: solve the truss problem by SOLO algorithm
* <strong>main_ba.py</strong>: solve the truss problem by Bat Algorithm (BA) algorithm

Auxiliary files:

* <strong>truss.py</strong>: a class to compute stress and strain of a truss structure
* <strong>mlopt.py</strong>: (abbreviation of Machine Learning and OPTimization) train a Deep Learning Network (DNN) and obtain the optimized solution
  based on the DNN by Bat Algorithm (BA)
* <strong>ba_lowmem.py</strong>: implement Bat Algorithm (which allows lower memory usage compared with the [BA in the heat example](../heat/ba.py))
* <strong>utils.py</strong>: utility functions

## Data

If you run the code, log files will be generated which records the results. By default the log file is named "result.log".

Data is not uploaded to Github. Please download
from [Google Drive](https://drive.google.com/drive/folders/1f6Xrd9e-RAUsh9vqIqUXbEw8F1_2Qg_5?usp=sharing) (summerized in an Excel file) or email us.

## How to run

Three problems (with different numbers of variables) solved by two algorithms (SOLO/BA) can be run by the same files with different arguments:

SOLO

* 72: `python main_solo.py --n_node 20 --n_0 100 -n 10 --n_iter 190 --n_ba 500000 --maxiter 2000 --node 512`
* 432: `python main_solo.py --n_node 100 --n_0 500 -n 50 --n_iter 390 --n_ba 500000 --maxiter 2000 --node 512`
* 1008: `python main_solo.py --n_node 228 --n_0 1000 -n 100 --n_iter 490 --n_ba 1000000 --maxiter 2000 --node 1024`

BA

* 72: `python main_ba.py --n_node 72 --n_ba 1000 --maxiter 1000`
* 432: `python main_ba.py --n_node 100 --n_ba 20000 --maxiter 2000`
* 1008: `python main_ba.py --n_node 228 --n_ba 50000 --maxiter 2000`

The meanings of these arguments are in `main_solo.py` and `main_ba.py` files. 