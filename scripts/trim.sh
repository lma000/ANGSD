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
mkdir -p trimmed/$folder
for file1 in $folder/*_1.fastq.gz; do
file2=${file1/_1/_2}
    
trim_galore --cores 8 --o trimmed/$folder --paired --illumina --stringency 4 $file1 $file2

done
done
