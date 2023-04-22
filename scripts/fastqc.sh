#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=fastqc
#SBATCH --output=../slurm/fastqc.out
#SBATCH --time=12:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1

mamba activate angsd

fastqc -o fastqc trimmed/*/*fq.gz
