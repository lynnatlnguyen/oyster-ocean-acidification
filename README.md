Ocean Acidification in Pacific oysters (Crassostrea gigas) Gene Expression

Description: We are determining how ocean acidification, as represented by pH levels, impacts the transcriptome of Pacific oysters. The normal pH environment is represented by pH 7.8, which is used as the control (reference) group, while pH 7.5 represents the experiemental group testing the transcriptomic responses of acidified ocean conditions.

Data Acquisition
1. Download SRAtoolkit
2. Obtain accession numbers for pH 7.8 and pH 7.5 from NCBI:
pH 7.8: SRX11136234
pH 7.5: SRX11136232
3. Fetch data for each group using prefetch
4. Convert .sra files to .fastq files using fasterq-dump

Transcriptome Assembly
1. Create scripts to run SPAdes for each group
2. Run scripts through SLURM
