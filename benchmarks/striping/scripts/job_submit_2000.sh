#!/bin/bash

mkdir -p /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/results/$1/slurm_output
cd /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/results/$1/slurm_output

for repeat in 1 2 3
do
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/scripts/copy_file2000.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/scripts/8node224_2000.sh $1 $repeat
    sbatch /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/scripts/copy_file2000.sh /pylon5/mc4sb2p/edisj/Bridges/benchmarks/striping/scripts/16node448_2000.sh $1 $repeat
done
