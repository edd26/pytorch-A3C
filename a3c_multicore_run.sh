#!/bin/bash
#PBS -N A3C_multicore_run
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=10
#PBS -k oe

echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $PBS_NODEFILE
echo ------------------------------------------------------
echo PBS: qsub is running on $PBS_O_HOST
echo PBS: originating queue is $PBS_O_QUEUE
echo PBS: executing queue is $PBS_QUEUE
echo PBS: working directory is $PBS_O_WORKDIR
echo PBS: execution mode is $PBS_ENVIRONMENT
echo PBS: job identifier is $PBS_JOBID
echo PBS: job name is $PBS_JOBNAME
echo PBS: node file is $PBS_NODEFILE
echo PBS: current home directory is $PBS_O_HOME
echo PBS: PATH = $PBS_O_PATH
echo ------------------------------------------------------


source /home/ed19aaf/miniconda3/etc/profile.d/conda.sh
# this env must be set before loading cuda module
export LD_LIBRARY_PATH=/home/ed19aaf/miniconda3/lib

WORKING_DIR="/home/ed19aaf/Programming/Python/pytorch-A3C"

echo $(pwd)
cd $WORKING_DIR
echo "Directory after change:"
echo $(pwd)

conda activate a3c
sleep 23; python discrete_A3C.py

echo ------------------------------------------------------
echo Job ends


