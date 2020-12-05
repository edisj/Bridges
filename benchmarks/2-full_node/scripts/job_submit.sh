#!/bin/bash

mkdir -p /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/results/$1/slurm_output
cd /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/results/$1/slurm_output

sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/1node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/2node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/4node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/6node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/8node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/12node.sh $1
sbatch /pylon5/mc4sb2p/edisj//Bridges/benchmarks/2-full_node/scripts/16node.sh $1
