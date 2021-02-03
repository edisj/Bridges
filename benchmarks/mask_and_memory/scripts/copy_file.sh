#!/bin/bash

#SBATCH -N 1  # number of nodes
#SBATCH --ntasks-per-node=1  # number of cores
#SBATCH -t 02:00:00   # time in hh:mm:ss
#SBATCH -p RM       # partition


#echo commands to stdout
set -x

sbatch --dependency=$SLURM_JOB_ID $1 $2 $3

TEST_TOP=$SCRATCH/Bridges/datafiles/YiiP_system.pdb
TEST_TRAJ=$SCRATCH/Bridges/datafiles/YiiP_system_9ns_center100x.h5md

testdir=$SCRATCH/Bridges/temp/$SLURM_JOB_ID
mkdir -p $testdir
time cp $TEST_TOP $testdir
time cp $TEST_TRAJ $testdir
