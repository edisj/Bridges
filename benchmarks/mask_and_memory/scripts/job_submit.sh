#!/bin/bash

mkdir -p /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/results/$1/slurm_output
cd /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/results/$1/slurm_output

for repeat in 1 2 3
do
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/1node1.sh $1 $repeat
    #sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/1node28.sh $1 $repeat
    #sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/2node56.sh $1 $repeat
    #sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/4node112.sh $1 $repeat
done
