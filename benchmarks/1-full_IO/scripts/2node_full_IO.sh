#!/bin/bash

#SBATCH -N 2  # number of nodes
#SBATCH --ntasks-per-node=28  # number of cores
#SBATCH -t 04:00:00   # time in hh:mm:ss
#SBATCH -p GPU       # partition
#SBATCH --gres=gpu:k80:4
#SBATCH -o slurm/slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm/slurm.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=ejakupov@asu.edu # Mail-to address

#echo commands to stdout
set -x

cd $HOME
module purge
module load anaconda3/5.2.0
module load phdf5/1.10.2_gnu_openmpi
source activate MDA

TEST_TOP=$SCRATCH/parallel_h5md/datafiles/YiiP_system.pdb
TEST_TRAJ=$SCRATCH/parallel_h5md/datafiles/YiiP_system_9ns_center100x.h5md

testdir=$SCRATCH/parallel_h5md/benchmarking/$SLURM_JOB_ID
mkdir -p $testdir
cp $TEST_TOP $testdir
cp $TEST_TRAJ $testdir

cd /pylon5/mc4sb2p/edisj/parallel_h5md/scripts/Bridges/rmsd/90Kframe/full_IO
export OMP_NUM_THREADS=1
export  I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0

for j in 1 2 3
do
    for i in 28 42 56
    do
        mpiexec -n $i python full_IO_bench.py $testdir/YiiP_system.pdb $testdir/YiiP_system_9ns_center100x.h5md $1/2node_$j
    done
done

rm -r $testdir
