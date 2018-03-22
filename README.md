FIDIMAG
=======

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/computationalmodelling/fidimag/master)
[![Build Status](https://travis-ci.org/computationalmodelling/fidimag.svg?branch=master)](https://travis-ci.org/computationalmodelling/fidimag)
[![Documentation Status](https://readthedocs.org/projects/fidimag/badge/?version=latest)](http://fidimag.readthedocs.org/en/latest/?badge=latest)
[![codecov](https://codecov.io/gh/computationalmodelling/fidimag/branch/master/graph/badge.svg)](https://codecov.io/gh/computationalmodelling/fidimag)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.167858.svg)](https://doi.org/10.5281/zenodo.167858)
[![Website](https://img.shields.io/website-up-down-green-red/http/shields.io.svg?label=Fidimag-Website)](http://computationalmodelling.github.io/fidimag/)

<img src="http://computationalmodelling.github.io/fidimag/figs/skyrmion.jpg" alt="Fidimag Image" width="400" align="right">

Fidimag solves finite-difference micromagnetic problems and supports atomistic simulations, using Python interface. The interface to both types of simulation is similar.

## Features
* Offers LLG and LLG with spin torque terms (Zhang-Li and Sloncewski)
* Calculations using the Nudged-Elastic-Band method to compute energy barriers.
* Exchange, Zeeman, Demagnetising, Uniaxial Anisotropy energy classes.
* Parallelised using OpenMP.
* Easily extensible to add new features.
* Cubic and Hexagonal Meshes in atomistic simulations.



#### Attributions 
The code is developed by Weiwei Wang, Marc-Antonio Bisotti, David Cortes, Thomas Kluyver, Mark Vousden, Ryan Pepper, Oliver Laslett, Rebecca Carey, and Hans Fangohr at the University of Southampton.

This is an early experimental version; contributions and pull requests to both the code and documentation are welcome.
If you use Fidimag, please cite as:

David Cortés-Ortuño, Weiwei Wang, Ryan Pepper, Marc-Antonio Bisotti, Thomas Kluyver, Mark Vousden, & Hans Fangohr. (2016). Fidimag v2.0 [Data set]. Zenodo. http://doi.org/10.5281/zenodo.167858A bib file is provided in the repository.

#### Publications

The following publications, in reverse chronological order, have used Fidimag:

[1] [Thermal stability and topological protection of skyrmions in nanotracks, D. Cortés-Ortuño, W. Wang, M. Beg, R.A. Pepper, M-A. Bisotti, R. Carey, M. Vousden, T. Kluyver, O. Hovorka & H. Fangohr, Scientific Reports 7, 4060 (2017)](https://www.nature.com/articles/s41598-017-03391-8)

[2] [Current-induced instability of domain walls in cylindrical nanowires, W. Wang, Z. Zhang, R.A. Pepper, C. Mu, Y. Zhou & Hans Fangohr, Journal of Physics: Condensed Matter, 30, 1 (2017)](http://iopscience.iop.org/article/10.1088/1361-648X/aa9698/meta)

[3] [Magnonic analog of relativistic Zitterbewegung in an antiferromagnetic spin chain, W. Wang, C. Gu, Y. Zhou & H. Fangohr, Phys. Rev. B 96](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.96.024430)

We acknowledge financial support from EPSRC’s Centre for Doctoral Training in Next Generation Computational Modelling (EP/L015382/1) and EPSRC’s Doctoral Training Centre in Complex System Simulation (EP/G03690X/1)
