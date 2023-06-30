<br/>
<p align="center"><img src="img/adaptive_dpt.png" width=700 /></p>

----
![Crates.io](https://img.shields.io/crates/l/Ap?color=orange)

Adapative-DPT the first NAS algorithm to make use of adaptive subset selection. The training time needed to find high-performing architectures is substantially reduced. We also add facility location as a novel baseline for subset selection applied to NAS. 
Through extensive experiments, we show that ADAPTIVE-DPT substantially reduce the runtime needed for running DARTS-PT with no decrease in the final (test) accuracy of the returned architecture.


We present the first subset selection approach to neural architecture search. We uncover a natural connection between one-shot NAS algorithms and adaptive subset selection and devise an algorithm that makes use of state-of-the-art techniques from both areas. We use these techniques to substantially reduce the runtime of DARTS-PT (a leading one-shot NAS algorithm), as well as BOHB and DEHB (leading multifidelity optimization algorithms), by up to 8x, without sacrificing accuracy.

Overview
------------

This codebase extends the excellent public repository [DARTS-PT](https://github.com/ruocwang/darts-pt). 
The codebase consists of three different approaches to subset selection for NAS (using DARTS-PT).

1. Facility Location - we have used submodlib library's facility loaction function implemenatation. You can read more about facility location [here](https://submodlib.readthedocs.io/en/latest/functions/facilityLocation.html).

2. Proxy data - this implementation is based on [prior work](https://arxiv.org/abs/2106.04784). We have extended their [code](https://github.com/nabk89/NAS-with-Proxy-data) to DARTS-PT. The supernetwork is trained and discretized using a subset of the training data, selected using a combination of high and low-entropy datapoints.

3. Adaptive-DPT - Adaptive subset selection using [GLISTER](https://arxiv.org/abs/2012.10630).

Preparing the environment
--------------------------
We used the same setup as in DARTS-PT. See [here](https://github.com/ruocwang/darts-pt).

Datasets and Search spaces used 
-------------------------------
Code for 3 datasets: Cifar-10, Cifar-100, Imagenet16-120. We also ran our code on multiple search spaces: NAS-Bench-201, DARTS and S4. 

Data can be fetched from https://github.com/ruocwang/darts-pt.

Running experiments
--------------------
To run the code with multiple seeds, go to our_work/darts-pt/exp_scripts and run: bash run_proxy_seeds.sh
To run on different datasets and search spaces, please follow the same commands as in: https://github.com/ruocwang/darts-pt

Results of Adaptive-DPT
-------------------------

|Dataset        | Search Space  |        Accuracy           | GPU hours | Subset size |
|:-------------:|:-------------:|:-------------------------:|:---------:|:-----------:|
|Cifar-10       | Nas-Bench-201 |    92.22 ± 1.76           | 0.83      |    10       |
|Cifar-100      | Nas-Bench-201 |    64.27 ± 3.37           | 0.87      |    10       |
|Imagenet16-120 | Nas-Bench-201 |    36.10 ± 6.96           | 2.60      |    10       |
|Cifar-10       |      S4       |    97.30 ± 0.12           | 1.08      |    10       |
|Cifar-10       |     DARTS     |    97.30 ± 0.05           | 8.82      |    30       |
