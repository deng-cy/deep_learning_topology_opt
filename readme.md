# Code for _Self-Directed Online Machine Learning for Topology Optimization_

[This repository](https://github.com/deng-cy/deep_learning_topology_opt) contains code of the following paper:

Changyu Deng, Yizhou Wang, Can Qin, Yun Fu, and Wei Lu. "Self-Directed Online Machine Learning for Topology Optimization." Nature Communications
13.1 (
2022) [Website](https://www.nature.com/articles/s41467-021-27713-7) [Download](https://www.nature.com/articles/s41467-021-27713-7.pdf) [arXiv](https://arxiv.org/pdf/2002.01927.pdf)

## Contact

Open an issue for this repository or send emails to dengcy@umich.edu. I will try to respond within a few hours. Pull requests are welcome.

## Introduction

There are 8 examples of 4 types in the paper, two compliance minimization problems ([coarse mesh](./force_coarse)/[fine mesh](./force_coarse)), two
fluid-structure optimization problems ([coarse mesh](./fluid_coarse)/[fine mesh](./fluid_fine)), a heat transfer enhancement problem ([heat](./heat))
and three truss optimization problems ([truss](./truss)). Their code is in their individual folders; they do not share files. Please refer to
the `readme.md` file in their own folder for more specific info.

If you are not sure which example to start from, I recommend

* [Fluid problem](./fluid_coarse), if you have a GPU. It needs Python, COMSOL and Matlab. It is simple to undertsand and computes fast when you have a
  GPU.

* [Compliance problem](./force_coarse), if you do not have a GPU. It needs Python, COMSOL and Matlab. It costs least computation but does not leverage
  GPU, so it will be slower than fluid problems when you have a GPU.

* [Truss problem](./truss), if you only have Python installed and do not want to install Matlab or COMSOL. It only uses Python, yet requires a GPU (
  you can easily change the code to run on CPU, but you will wait for too long). Also, it is a little harder to understand than compliance problems
  and fluid problems.

I do NOT recommend starting from the [heat problem](./heat). It is not easy to understand and time-consuming to compute.

## Software environment

Following softwares are used by __most__ examples:

* COMSOL Multiphysics 5.4
* Matlab 2019b
* Python 3.7
  * PyTorch 1.2.0

Higher versions should work fine. Lower versions may be compatible. Refer to the folders for more details. Some different packages may be needed.

## Reproducibility

Please note that the reproducibility is not guranteed due to PyTorch platform (see
its [documentation](https://pytorch.org/docs/stable/notes/randomness.html#reproducibility)), yet similar results are expected.

## Alternative repositories

There are four repositories that store the code/data of this work.

Code only:

* [Github repository](https://github.com/deng-cy/deep_learning_topology_opt) (most recommended). It contains latest code and directions to latest
  data.
* [Zenodo repository](https://zenodo.org/record/5722376). It contains releases of code.

Code and data (including generated .mph files and optimization results):

* [Google drive](https://drive.google.com/drive/folders/1f6Xrd9e-RAUsh9vqIqUXbEw8F1_2Qg_5?usp=sharing).
* [Zenodo database](https://doi.org/10.5281/zenodo.5725598).