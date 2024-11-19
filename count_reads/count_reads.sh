#!/bin/bash
#SBATCH --job-name=count_reads
#SBATCH --output=count_reads.out
#SBATCH --time=24:00:00
#SBATCH --mem=60G
#SBATCH --cpus-per-task=20

# run featureCounts
/project/stuckert/ltnguy95/final_project/subread-2.0.8-Linux-x86_64/bin/featureCounts -p  -a /project/stuckert/ltnguy95/final_project/aligned_reads/GCF_963853765.1_xbMagGiga1.1_genomic.gtf -o /project/stuckert/ltnguy95/final_project/count_reads/count_reads.txt /project/stuckert/ltnguy95/final_project/aligned_reads/experiment_alignedto_control_sorted.bam
