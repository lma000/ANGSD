#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=featurecounts
#SBATCH --output=../../slurm/fc.out
#SBATCH --time=12:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1

mamba activate angsd

featureCounts -O -p -a /athena/angsd/scratch/lim4019/project2/index/mm39.gtf -o featureCounts.txt */*Aligned.sortedByCoord.out.bam
