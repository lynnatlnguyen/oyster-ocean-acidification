#!/bin/bash
#SBATCH --job-name=align_reads
#SBATCH --output=align_reads.out
#SBATCH --time=24:00:00
#SBATCH --mem=60G
#SBATCH --cpus-per-task=20

# define path to input files and output files
control_assembly="/project/stuckert/ltnguy95/final_project/control_pH7.8/control_spades_output/contigs.fasta"
experiment_forward_reads="/project/stuckert/ltnguy95/final_project/experiment_pH7.5/SRR14803110_1.fastq"
experiment_reverse_reads="/project/stuckert/ltnguy95/final_project/experiment_pH7.5/SRR14803110_2.fastq"
output_sam="/project/stuckert/ltnguy95/final_project/aligned_reads/experiment_alignedto_control.sam"
output_bam="/project/stuckert/ltnguy95/final_project/aligned_reads/experiment_alignedto_control.bam"
samtools="/project/stuckert/ltnguy95/final_project/samtools-1.21"

# step 1: build hisat2 index for control assembly
/project/stuckert/ltnguy95/final_project/hisat2/hisat2-build $control_assembly control_index

# step 2: align experimental reads to control (reference)
/project/stuckert/ltnguy95/final_project/hisat2/hisat2 -x control_index -1 $experiment_forward_reads -2 $experiment_reverse_reads -S $output_sam

# step 3: convert SAM to BAM
/project/stuckert/ltnguy95/final_project/samtools-1.21/samtools view -bS $output_sam > $output_bam

# step 4: sort BAM file
/project/stuckert/ltnguy95/final_project/samtools-1.21/samtools sort $output_bam -o ${output_bam%.bam}_sorted.bam

# step 5: index sorted BAM file (for downstream analysis)
/project/stuckert/ltnguy95/final_project/samtools-1.21/samtools index ${output_bam%.bam}_sorted.bam

# step 6: perform differential analysis in R (separate)


