#!/bin/bash
#SBATCH -o metaviralspades.%j.out
#SBATCH -e metaviralspades.%j.err
#SBATCH -D .
#SBATCH -N 1
#SBATCH -t 7-00:00:00
#SBATCH -p small-gpu

 spades.py --metaviral \
    -m 384 \
    -t 36 \
    --pe1-1 ../../steam_vents_19/metaviralspades/trimmed/${j}_1.trimmed.fastq.gz \
    --pe1-2 ../../steam_vents_19/metaviralspades/trimmed/${j}_2.trimmed.fastq.gz \
    -k 21,33,55,77 \
    -o viral_spades_${j}

cd viral_spades_${j}

seqtk comp contigs.fasta | awk '{if($2 >= 1000) print $1}' > contigs_gt1kb.list
seqtk subseq contigs.fasta contigs_gt1kb.list > contigs_gt1kb.fasta

done 
