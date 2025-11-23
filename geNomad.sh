#!/bin/bash
#SBATCH -o gm.%j.out
#SBATCH -e gm.%j.err
#SBATCH -D .
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH -p 384gb

parallel -j 17 -a contigs.list 'genomad end-to-end --cleanup --splits 8 ../metaviral_spades_contigs/{}.fasta {} ~/databases/genomad_db'
