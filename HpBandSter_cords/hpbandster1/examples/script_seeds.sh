#!/bin/bash

runs=(1 2 3)



for i in ${!runs[@]}; do

    dir="example_5_run_$i"
    mkdir $dir
    out="output_"
    out+=$i
    dir+="/"
    out=$dir$out
    echo $out
    python3 example_5_mnist.py --backend pytorch --shared_directory $dir 2>&1 | tee $out

done
