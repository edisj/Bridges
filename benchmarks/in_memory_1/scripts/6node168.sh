#!/bin/bash

#SBATCH -N 6  # number of nodes
#SBATCH --ntasks-per-node=28  # number of cores
#SBATCH -t 01:00:00   # time in hh:mm:ss
#SBATCH -p RM      # partition
#SBATCH -o 6node168.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e 6node168.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=ejakupov@asu.edu # Mail-to address

#echo commands to stdout
set -x

module load anaconda3/5.2.0
module load phdf5/1.10.2_gnu_openmpi
source activate MDA

testdir=$SCRATCH/Bridges/temp/$SLURM_JOB_DEPENDENCY

export OMP_NUM_THREADS=1

time mpiexec -n 168 python -W ignore $SCRATCH/Bridges/benchmarks/in_memory_1/scripts/benchmark.py $testdir/YiiP_system.pdb $testdir/YiiP_system_9ns_center100x.h5md $1/6node_$2

rm -r $testdir
