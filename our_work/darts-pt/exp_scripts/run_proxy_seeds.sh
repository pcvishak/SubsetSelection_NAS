#!/bin/bash
seeds=(0 10 20 30 40)
seeds_proj=(0 10 20 30 40)

for i in ${!seeds[@]}; do
	sh darts-201.sh ${seeds[$i]}
	echo darts for seed ${seeds[$i]} completed
	sh darts-proj-201.sh ${seeds[$i]} ${seeds_proj[$i]}
	echo darts-proj for seed ${seeds_proj[$i]} completed
done
