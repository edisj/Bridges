#!/bin/bash

mkdir -p /scratch/ejakupov/Agave/benchmarks/2-full_IO/results/$1/slurm_output
cd /scratch/ejakupov/Agave/benchmarks/2-full_IO/results/$1/slurm_output

for repeat in 1 2 3
do
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/2node28.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/4node84.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/6node140.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/8node196.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/12node308.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/copy_file.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/mask_and_memory/scripts/16node420.sh $1 $repeat
done
