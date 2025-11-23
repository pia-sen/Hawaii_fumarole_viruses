#!/bin/bash
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH -D .
#SBATCH -N 1
#SBATCH -t 7-00:00:00
#SBATCH -p large-gpu


for i in P14-16 P18-20 P23-25 P2-4 P27-29 P8-12 PDB5 S13-15 S18-20 S22-25 S2-4 S29-31 S3
4-36 S37 S7-8 V2 W1-4; do

#for i in ${SAMPLE}; do

#virsorter run --prep-for-dramv -w ${i}_virsorter_out -i ../assemblies/${i}.contigs.fast
a --include-groups "dsDNAphage,NCLDV,RNA,ssDNA,lavidaviridae" -j 30 all

~/miniconda3/envs/DRAM2/bin/DRAM-v.py annotate -i ${i}_virsorter_out/for-dramv/final-vir
al-combined-for-dramv.fa -v ${i}_virsorter_out/for-dramv/viral-affi-contigs-for-dramv.ta
b -o ${i}_DRAMv_annotate

~/miniconda3/envs/DRAM2/bin/DRAM-v.py distill -i ${i}_DRAMv_annotate/annotations.tsv -o 
${i}_DRAMv_annotate/distilled

#DRAM-setup.py update_description_db

done
