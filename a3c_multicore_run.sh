#!/bin/bash
#PBS -N A3C_multicore_run
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=10
#PBS -k oe
# CHANGE RESOURCES (0) -^

# Very basic script to submit a job to the cluster, please change the sections listed
# below to your needs:
# (0) Resources allocated (first few lines of this script)- see wiki for explanation: https://uhhpc.herts.ac.uk/wiki/index.php/Jobs
# (1) Miniconda path- given that you installed your own miniconda, adjust the path to the script
# (2) Working directory- where your scripts are allocated
# (3) Conda environment and script- adjust according to how you named your env and which script you want to use

# >>> PRINT
# Lines in this section are a standard print to provide some basic info about
# allocated resources
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
# <<< PRINT

# >>> CHANGE MINICONDA PATHS (1)
# In order to use miniconda, it has to be sourced with the following line
source /home/ed19aaf/miniconda3/etc/profile.d/conda.sh
# this env must be set before loading cuda module
export LD_LIBRARY_PATH=/home/ed19aaf/miniconda3/lib
# <<< CHANGE MINICONDA PATHS

# >>> CHANGE WORKING DIRECTORY (2)
WORKING_DIR="/home/ed19aaf/Programming/Python/pytorch-A3C"
# <<< CHANGE WORKING DIRECTORY

echo $(pwd)
cd $WORKING_DIR
echo "Directory after change:"
echo $(pwd)

# >>> CHANGE CONDA ENV AND SCRIPT TO RUN (3)
conda activate a3c
sleep 23; python discrete_A3C.py
# <<< CHANGE CONDA ENV AND SCRIPT TO RUN

echo ------------------------------------------------------
echo Job ends


