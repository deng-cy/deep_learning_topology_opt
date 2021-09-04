# Code for _Self-Directed Online Machine Learning for Topology Optimization_
This repository contains code of the following paper:

Changyu Deng, Yizhou Wang, Can Qin, Yun Fu, and Wei Lu. "Self-Directed Online Machine Learning for Topology Optimization." arXiv preprint arXiv:
2002.01927 (2020) [Download](https://arxiv.org/pdf/2002.01927.pdf)

We are still working on the manuscript. More code and results will be uploaded soon.

## Contact

Open an issue for this repository or send emails to dengcy@umich.edu. I will try to respond within a few hours. Pull requests are welcome.

## Introduction

There are 8 examples of 4 types in the paper, two compliance minimization problems ([coarse mesh](./force_coarse)/[fine mesh](./force_coarse)), two
fluid-structure optimization problems ([coarse mesh](./fluid_coarse)/[fine mesh](./fluid_fine)), a heat transfer enhancement problem ([heat](./heat))
and three truss optimization problems ([truss](./truss)). Their code is in their individual folders; they do not share files. Please refer to
the `readme.md` file in their own folder for more specific info.

## Software environment

Following softwares are used:

* COMSOL Multiphysics 5.4
* Matlab 2019b
* Python 3.7
  * PyTorch 1.2.0

Higher versions should work fine. Lower versions may be compatible. Refer to the folders for more details. Some additional packages may be needed.

## Reproducibility

Please note that the reproducibility is not guranteed due to PyTorch platform (see
its [documentation](https://pytorch.org/docs/stable/notes/randomness.html#reproducibility)), yet similar results are expected.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Change log

2021-09-04 Uploaded all examples. More comments and instructions for the truss problems will be added later.

2021-09-03 Fixed some issues in existing examples to match the paper. New examples will be uploaded soon.  