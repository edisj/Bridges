#!/bin/bash

#SBATCH -N 1  # number of nodes
#SBATCH --ntasks-per-node=28  # number of cores
#SBATCH -t 04:00:00   # time in hh:mm:ss
#SBATCH -p RM       # partition
#SBATCH -o 1node28.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e 1node28.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=ejakupov@asu.edu # Mail-to address

#echo commands to stdout
set -x

sbatch --dependency=$SLURM_JOB_ID $1 $2 $3

TEST_TOP=/scratch/ejakupov/Agave/datafiles/YiiP_system.pdb
TEST_TRAJ=/scratch/ejakupov/Agave/datafiles/YiiP_system_9ns_center100x.h5md

testdir=/scratch/ejakupov/Agave/temp/$SLURM_JOB_ID
mkdir -p $testdir
time cp $TEST_TOP $testdir
time cp $TEST_TRAJ $testdir
