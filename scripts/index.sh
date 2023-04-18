#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=index
#SBATCH --output=slurm/index.out
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --mail-user=lim4019@med.cornell.edu
#SBATCH --mail-type=ALL

mamba activate angsd

STAR --runMode genomeGenerate --runThreadN 1 --genomeDir index --genomeFastaFiles mm39.fa --sjdbGTFfile mm39.ncbiRefSeq.gtf --sjdbOverhang 99
