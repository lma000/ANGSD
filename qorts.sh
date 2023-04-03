#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=qorts
#SBATCH --output=../../slurm/qorts.out
#SBATCH --time=2-00:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1

mamba activate qorts

for file in ./*/*.bam; do
mkdir ${file:0:${#file}-29}
qorts -Xmx24000M QC --stranded --generatePlots $file /athena/angsd/scratch/lim4019/project2/index/mm39.gtf ${file:0:${#file}-29}
done
