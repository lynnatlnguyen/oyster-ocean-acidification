#!/bin/bash
#SBATCH --job-name=control_spades
#SBATCH --output=control_spades.out
#SBATCH --time=24:00:00
#SBATCH --mem=60G
#SBATCH --cpus-per-task=20

# define input files and output directory
control_forward="SRR14803108_1.fastq"
control_reverse="SRR14803108_2.fastq"
CONTROL_OUTPUT="control_spades_output"

# create directories for outputs
mkdir -p $CONTROL_OUTPUT

# run spades
/project/stuckert/ltnguy95/final_project/SPAdes-4.0.0-Linux/bin/spades.py -1 $control_forward -2 $control_reverse -o $CONTROL_OUTPUT

# print completion messages
echo "spades control assembly completed."
