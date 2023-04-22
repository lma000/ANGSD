#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=align_reads
#SBATCH --output=../slurm/align.out
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=10

mamba activate angsd

for folder in $(cat conditions); do 
mkdir -p alignments/$folder
for file1 in $folder/*_1.fq.gz; do
file2=${file1/_1_val_1/_2_val_2}
    
STAR --runMode alignReads --runThreadN 10 --genomeDir /athena/angsd/scratch/lim4019/project2/index/index --readFilesIn $file1 $file2 --readFilesCommand zcat --outFileNamePrefix alignments/${file1%%_1_val_1.fq.gz}. --outSAMtype BAM SortedByCoordinate --outSAMattributes MD

done
done
