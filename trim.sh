#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=trim
#SBATCH --output=../slurm/trim.out
#SBATCH --time=24:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=8

mamba activate trim-galore

for folder in $(cat conditions); do
mkdir trimmed/$folder
trim_galore --cores 8 --o trimmed/$folder --paired --illumina --stringency 4 $folder/*_1.fastq.gz $folder/*_2.fastq.gz
done
