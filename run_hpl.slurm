#!/bin/bash

# Slurm job options (name, compute nodes, job time)
#SBATCH --job-name=EPCC_CH01_HPL
#SBATCH --time=0:20:0
#SBATCH --exclusive
#SBATCH --nodes=2
#SBATCH --tasks-per-node=288
#SBATCH --cpus-per-task=1

#SBATCH --account=tc079

# We use the "standard" partition as we are running on CPU nodes
#SBATCH --partition=standard

# We use the "standard" QoS as our runtime is less than 2 days
#SBATCH --qos=standard

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically
#   using threading.
export OMP_NUM_THREADS=1

# Launch the parallel job
#   srun picks up the distribution from the sbatch options
srun --hint=nomultithread --distribution=block:block ./bin/cirrus/xhpl
