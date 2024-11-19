# Ocean Acidification in Pacific oysters (Crassostrea gigas) Gene Expression

# Description
We are determining how ocean acidification, as represented by pH levels, impacts the transcriptome of Pacific oysters. The normal pH environment is represented by pH 7.8, which is used as the control (reference) group, while pH 7.5 represents the experiemental group testing the transcriptomic responses of acidified ocean conditions.

# Packages Used
- SRAtoolkit
- SPAdes
- HISAT2
- samtools
- Subreads (featureCounts)
- DESeq2 (in RStudios)

# Data Acquisition
SRAtoolkit and data download commands under "download_data"
1. Download SRAtoolkit
2. Obtain accession numbers for pH 7.8 and pH 7.5 from NCBI:
<br/>pH 7.8: SRX11136234
<br/>pH 7.5: SRX11136232
3. Fetch data for each group using prefetch
4. Convert .sra files to .fastq files using fasterq-dump

# Transcriptome Assembly
1. Download SPAdes
2. Create scripts to run SPAdes for each group
<br/>pH 7.8: control_spades.sh
<br/>pH 7.5: experiment_spades.sh
3. Run scripts through SLURM

# Align Reads
1. Download HISAT2
2. Download samtools
3. Run align_reads.sh through SLURM to align the contigs.fasta output of pH 7.5 to that of pH 7.8 (used as reference) and convert the SAM file to BAM

# Count Reads
1. Download Subreads
2. Obtain GTF file for Pacific oysters from NCBI
3. Run count_reads.sh using featureCounts through SLURM to count the number of RNA-Seq reads mapped to each gene based on the alignment and GTF (annotation) file  

# DIfferential Analysis in RStudios
All codes provided in "r_codes"
1. Copy count_reads.txt from cluster to local desktop
2. Prepare "count_data" in R using count_reads.txt
3. Ran into issues with formatting of count_data (negative, zero, non-numerical values); fixed with codes to manipulate "count_data"
4. Performed differential expression analysis with DESeq2 library 
5. Summarized results to obtain fold-change and p-value data
6. Created graphs to visualize expression results
