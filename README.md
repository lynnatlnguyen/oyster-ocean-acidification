# Ocean Acidification in Pacific oysters (Crassostrea gigas) Gene Expression

# Description
We are determining how ocean acidification, as represented by pH levels, impacts the transcriptome of Pacific oysters. The normal pH environment is represented by pH 7.8, which is used as the control (reference) group, while pH 7.5 represents the experiemental group testing the transcriptomic responses of acidified ocean conditions.

# Data Acquisition
SRAtoolkit and data download commands under "download_data"
1. Download SRAtoolkit
2. Obtain accession numbers for pH 7.8 and pH 7.5 from NCBI:
pH 7.8: SRX11136234
pH 7.5: SRX11136232
3. Fetch data for each group using prefetch
4. Convert .sra files to .fastq files using fasterq-dump

# Transcriptome Assembly
1. Download SPAdes
2. Create scripts to run SPAdes for each group
pH 7.8: control_spades.sh
pH 7.5: experiment_spades.sh
3. Run scripts through SLURM

# Align Reads
1. Download HISAT2
2. Download samtools
3. Run align_reads.sh through SLURM to align the contigs.fasta output of pH 7.5 to that of pH 7.8 (used as reference) and convert the SAM file to BAM

# Count Reads
1. Download Subreads
2. Obtain GTF file for Pacific oysters from NCBI
3. Run count_reads.sh using featureCounts through SLURM to count the number of RNA-Seq reads mapped to each gene based on the alignment and GTF (annotation) file  
