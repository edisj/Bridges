#!/bin/bash

#SBATCH -N 2  # number of nodes
#SBATCH --ntasks-per-node=28  # number of cores
#SBATCH -t 02:00:00   # time in hh:mm:ss
#SBATCH -p RM      # partition
#SBATCH -o 2node.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e 2node.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=ejakupov@asu.edu # Mail-to address

#echo commands to stdout
set -x

module load anaconda3/5.2.0
module load phdf5/1.10.2_gnu_openmpi
source activate MDA

TEST_TOP=$SCRATCH/Bridges/datafiles/YiiP_system.pdb
TEST_TRAJ=$SCRATCH/Bridges/datafiles/YiiP_system_9ns_center100x.h5md

testdir=$SCRATCH/Bridges/temp/$SLURM_JOB_ID
mkdir -p $testdir
cp $TEST_TOP $testdir
cp $TEST_TRAJ $testdir

export OMP_NUM_THREADS=1

for j in 1 2 3
do
    mpiexec -n 56 python -W ignore $SCRATCH/Bridges/benchmarks/2-full_node/scripts/benchmark.py $testdir/YiiP_system.pdb $testdir/YiiP_system_9ns_center100x.h5md $1/2node_$j
done

rm -r $testdir
