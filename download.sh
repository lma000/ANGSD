#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=download_SRA
#SBATCH --output=../slurm/SRA.out
#SBATCH --time=24:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL

for file in SRA*.txt; do
mkdir ${file:3:${#file}-7}
for line in $(cat $file); do
name=($file)
wget ftp://$line -P ${file:3:${#file}-7}
done
done
