#!/bin/bash

#SBATCH -o matrix.%j.output
#SBATCH -e matrix.%j.err
#SBATCH -N 1
#SBATCH -p large-gpu
#SBATCH -D .
#SBATCH -t 7-00:00:00

lovis4u -gff ~/9.1_input_matrix/loviz_pharokka/single_gffs -hl 
--set-group-colour-for conserved --reorient_loci --run-hmmscan 
-o lovis4u -dm both --set-category-colour -c A4p1 
--show-x-axis --show-noncoding-labels
