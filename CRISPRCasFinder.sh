#!/bin/bash

#SBATCH -o ccfinder_bins.%j.output
#SBATCH -e ccfinder_bins.%j.err
#SBATCH -N 2
#SBATCH -p highThru
#SBATCH -D /CCAS/home/pia_sen/CCF
#SBATCH -t 7-00:00:0

for f in /CCAS/home/pia_sen/CCF/bins/*.fa; do

module load apptainer/1.0.1
singularity exec -B /CCAS/home/pia_sen/CCF CrisprCasFinder.simg perl /usr/local/CRISPRCasFinder/CRISPRCasFinder.pl \
-so /usr/local/CRISPRCasFinder/sel392v2.so \
-cf /usr/local/CRISPRCasFinder/CasFinder-2.0.3 \
-drpt /usr/local/CRISPRCasFinder/supplementary_files/repeatDirection.tsv \
-rpts /usr/local/CRISPRCasFinder/supplementary_files/Repeat_List.csv \
-levelMin 4 \
-meta \
-ccvr \
-cas \
-cpuM 80 \
-ccc 10000 \
-def SubTyping \
-outdir "$f" \
-in "$f" \
-log -html -keep 
module unload apptainer/1.0.1
done
