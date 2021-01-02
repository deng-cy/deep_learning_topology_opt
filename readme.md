# Code for _Self-Directed Online Machine Learning for Topology Optimization_
This repository contains code of the following paper:

Changyu Deng, Yizhou Wang, Can Qin, and Wei Lu. "Self-Directed  Online Machine Learning for Topology Optimization." arXiv preprint arXiv:2002.01927 (2020) [Download](https://arxiv.org/pdf/2002.01927.pdf) 

We are still working on the manuscript. More code and results will be uploaded soon. 

## Contact
Open an issue for this repository or send emails to dengcy@umich.edu. I will try to respond within a few hours.

## Introduction
There are 4 examples in the paper, two compliance minimization problems (coarse mesh in [force_coarse](./force_coarse), fine mesh in [force_fine](./force_coarse)) and two fluid-structure optimization problems (coarse mesh in [fluid_coarse](./fluid_coarse), fine mesh in [fluid_fine](./fluid_fine)). Their code is in their individual folders; they do not share files. Please refer to the `readme.md` file in their own folder for more specific info. 

## Software environment
All experiments are run on Windows 10, with following softwares: 
* COMSOL Multiphysics 5.4
* Matlab 2019b
* Python 3.7
  * PyTorch 1.2.0

Refer to the folders for more details. Some additional packages may be needed. 

## Reproducibility
Please note that the reproducibility is not guranteed due to PyTorch platform (see its [documentation](https://pytorch.org/docs/stable/notes/randomness.html#reproducibility)), yet similar results are expected. 

## License
[MIT](https://choosealicense.com/licenses/mit/)