#!/bin/bash

#SBATCH -o prodigal.%j.output
#SBATCH -e prodigal.%j.err
#SBATCH -N 1
#SBATCH -p large-gpu
#SBATCH -D /CCAS/home/pia_sen/final_2019_virus_id/all_contigs
#SBATCH -t 7-00:00:00


for f in *.fa; do
prodigal -i "$f" -a "$f"_translate.faa -f sco -o "$f".tsv -p meta
done
