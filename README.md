Official implementation of the work - Speeding up NAS with Adaptive Subset Selection (Adaptive DPT)
----------------------------------------------------------------------------------------------------

Adapative-DPT, the first NAS algorithm to make use of adaptive subset selection. The training time needed to find high-performing architectures is substantially reduced. We also add facility location as a novel baseline for subset selection applied to NAS. 
Through extensive experiments, we show that ADAPTIVE-DPT substantially reduce the runtime needed for running DARTS-PT with no decrease in the final (test) accuracy of the returned architecture.

Overview
------------

This codebase extends the excellent public repository DARTS-PT. 
The codebase consists of three different approaches to subset selection for NAS (using DARTS-PT).

1. Facility Location - While similar to DARTS-PT, the supernetwork is trained and discretized using a subset of the training data, selected using facility location. We have used submodlib library's facility loaction function implemenatation. You can read more about facility location from here https://submodlib.readthedocs.io/en/latest/functions/facilityLocation.html.

2. Proxy data - This implementation is based on the work https://arxiv.org/abs/2106.04784. We have extended their code https://github.com/nabk89/NAS-with-Proxy-data to DARTS-PT. The supernetwork is trained and discretized using a subset of the training data, selected using a combination of high and low-entropy datapoints.

3. Adaptive-DPT - Adaptive subset selection using GLISTER https://arxiv.org/abs/2012.10630.

Preparing the environment
--------------------------
We used the same set up as in DARTS-PT. You can read more about it from here https://github.com/ruocwang/darts-pt.

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

If you are using our work, Please cite us:

@inproceedings{prasad2022speeding,
  title={Speeding up NAS with Adaptive Subset Selection},
  author={Prasad, Vishak and White, Colin and Jain, Paarth and Nayak, Sibasis and Iyer, Rishabh K and Ramakrishnan, Ganesh},
  booktitle={First Conference on Automated Machine Learning (Late-Breaking Workshop)},
  year={2022}
