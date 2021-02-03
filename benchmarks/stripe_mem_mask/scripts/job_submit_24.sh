#!/bin/bash

mkdir -p /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/results/$1/slurm_output
cd /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/results/$1/slurm_output

for repeat in 1 2 3
do
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/copy_file_24.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/1node1_24.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/copy_file_24.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/1node28_24.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/copy_file_24.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/2node56_24.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/copy_file_24.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/stripe_mem_mask/scripts/4node112_24.sh $1 $repeat
done
