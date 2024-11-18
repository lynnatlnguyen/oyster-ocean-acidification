#!/bin/bash
#SBATCH --job-name=experiment_spades
#SBATCH --output=experiment_spades.out
#SBATCH --time=24:00:00
#SBATCH --mem=60G
#SBATCH --cpus-per-task=20

# define input files and output directory
experiment_forward="SRR14803110_1.fastq"
experiment_reverse="SRR14803110_2.fastq"
EXPERIMENT_OUTPUT="experiment_spades_output"

# create directories for outputs
mkdir -p $EXPERIMENT_OUTPUT

# run spades
/project/stuckert/ltnguy95/final_project/SPAdes-4.0.0-Linux/bin/spades.py -1 $experiment_forward -2 $experiment_reverse -o $EXPERIMENT_OUTPUT

# print completion messages
echo "spades experimental assembly completed."
