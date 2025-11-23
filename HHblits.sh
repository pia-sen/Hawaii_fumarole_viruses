#!/bin/bash

#SBATCH -o hhblits_putative_virus.%j.output
#SBATCH -e hhblits_putative_virus.%j.err
#SBATCH -N 2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=8
#SBATCH -p highThru
#SBATCH --nodelist=hth004,hth006
#SBATCH -D /CCAS/home/pia_sen/final_2019_virus_id/putative_viruses/hhblits/input
#SBATCH -J hhblits
#SBATCH -t 7-00:00:00


module load gcc/12.2.0 
module load cmake/3.27.0
module load python3/3.10.11

export HHLIB=/scratch/genomicsgrp/Databases/HHsuite
export HHDB=/scratch/genomicsgrp/Databases/HHsuite/uniprot_sprot_vir70

for f in *_clean.faa; do 
hhblits -i "$f" -o "$f"_n3_.hhr -oa3m "$f"_n3_.a3m -d $HHDB/uniprot_sprot_vir70 -cpu 8 -n 3
done
