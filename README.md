# ANGSD

Files for the ANGSD final project. 

Files: 
- `tsv` is a metadata file that contains information about RNA-seq runs from this [GEO dataset](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE198063), presented in the paper [Translatome profiling in fatal familial insomnia implicates TOR signaling in somatostatin neurons](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9531780) by Bauer et. al. (2022). 
- `conditions` is a file with 3 lines, each corresponding to a relevant genotype: Control, FFI, and CJD. This file is used as input for a number of the scripts to sepearate conditions into different folders or files. 
- `SRA*.txt` files contain the accession numbers for SST+ cells in each of the relevant genotypes. 
- `multiqc_report.html` is the report that aggregates results from FastQC, featureCounts, and QoRTs. 


Scripts: 
- `download.sh` downloads all SRA files from the accession numbers given in SRA*.txt into folders seperated by condition. 
- `index.sh` generates a genome index based on the mm39 mouse genome, which is later used for alignment. 
- `trim.sh` trims adapters from the `fastq.gz` samples. These trimmed files are used for the alignment. 
- `fastqc.sh` performs quality control on each trimmed file using FastQC. The outputs are later aggregated into a MultiQC report. 
