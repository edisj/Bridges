#!/bin/bash

mkdir -p $SCRATCH/Bridges/benchmarks/2-full_node/results/$1/slurm_output
cd $SCRATCH/Bridges/benchmarks/2-full_node/results/$1/slurm_output

sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/1node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/2node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/4node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/6node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/8node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/12node.sh $1
sbatch $SCRATCH/Bridges/benchmarks/2-full_node/scripts/16node.sh $1
