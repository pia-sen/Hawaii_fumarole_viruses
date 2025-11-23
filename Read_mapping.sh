#!/bin/bash

#SBATCH -o map_final_viruses.%j.output
#SBATCH -e map_final_viruses.%j.err
#SBATCH -N 1
#SBATCH -p med-gpu
#SBATCH -D /scratch/sawgrp/pia/2019_virus/mapping
#SBATCH -t 7-00:00:00


module load bowtie2/2.5.3

bowtie2-build final_viruses.fa HW_02_virus_map
bowtie2 -x HW_02_virus_map \
        -1 HW-02_R1.fastq.gz \
        -2 HW-02_R2.fastq.gz \
        -S HW02_virus_map.sam 
        
bowtie2-build final_viruses.fa HW_12_virus_map
bowtie2 -x HW_12_virus_map \
        -1 HW-12_R1.fastq.gz \
        -2 HW-12_R2.fastq.gz  \
        -S HW_12_virus_map.sam
        
bowtie2-build final_viruses.fa P14_16_virus_map
bowtie2 -x P14_16_virus_map \
        -1 P14-16_1.trimmed.fastq.gz \
        -2 P14-16_2.trimmed.fastq.gz  \
        -S P14_16_virus_map.sam

bowtie2-build final_viruses.fa P18_20_virus_map
bowtie2 -x P18_20_virus_map \
        -1 P18-20_1.trimmed.fastq.gz\
        -2 P18-20_2.trimmed.fastq.gz  \
        -S P18_20_virus_map.sam      

bowtie2-build final_viruses.fa P23_25_virus_map
bowtie2 -x P23_25_virus_map \
        -1 P23-25_1.trimmed.fastq.gz \
        -2 P23-25_2.trimmed.fastq.gz  \
        -S P23_25_virus_map.sam    

bowtie2-build final_viruses.fa P2_4_virus_map
bowtie2 -x P2_4_virus_map \
        -1 P2-4_1.trimmed.fastq.gz \
        -2 P2-4_2.trimmed.fastq.gz  \
        -S P2_4_virus_map.sam
        
bowtie2-build final_viruses.fa P27_29_virus_map
bowtie2 -x P27_29_virus_map \
        -1 P27-29_1.trimmed.fastq.gz \
        -2 P27-29_2.trimmed.fastq.gz  \
        -S P27_29_virus_map.sam

bowtie2-build final_viruses.fa P8_12_virus_map
bowtie2 -x P8_12_virus_map \
        -1 P8-12_1.trimmed.fastq.gz \
        -2 P8-12_2.trimmed.fastq.gz  \
        -S P8_12_virus_map.sam

bowtie2-build final_viruses.fa PDB5_virus_map
bowtie2 -x PDB5_virus_map \
        -1 PDB5_1.trimmed.fastq.gz \
        -2 PDB5_2.trimmed.fastq.gz  \
        -S PDB5_virus_map.sam

bowtie2-build final_viruses.fa S13_15_virus_map
bowtie2 -x S13_15_virus_map \
        -1 S13-15_1.trimmed.fastq.gz \
        -2 S13-15_2.trimmed.fastq.gz  \
        -S S13_15_virus_map.sam

bowtie2-build final_viruses.fa S18_20_virus_map
bowtie2 -x S18_20_virus_map \
        -1 S18-20_1.trimmed.fastq.gz \
        -2 S18-20_2.trimmed.fastq.gz  \
        -S S18_20_virus_map.sam
        
bowtie2-build final_viruses.fa S22_25_virus_map
bowtie2 -x S22_25_virus_map \
        -1 S22-25_1.trimmed.fastq.gz \
        -2 S22-25_2.trimmed.fastq.gz  \
        -S S22_25_virus_map.sam      

bowtie2-build final_viruses.fa S2_4_virus_map
bowtie2 -x S2_4_virus_map \
        -1 S2-4_1.trimmed.fastq.gz \
        -2 S2-4_2.trimmed.fastq.gz  \
        -S S2_4_virus_map.sam      
        
bowtie2-build final_viruses.fa S29_31_virus_map
bowtie2 -x S29_31_virus_map \
        -1 S29-31_1.trimmed.fastq.gz \
        -2 S29-31_2.trimmed.fastq.gz  \
        -S S29_31_virus_map.sam
        
bowtie2-build final_viruses.fa S34_36_virus_map
bowtie2 -x S34_36_virus_map \
        -1 S34-36_1.trimmed.fastq.gz \
        -2 S34-36_2.trimmed.fastq.gz \
        -S S34_36_virus_map.sam
        

bowtie2-build final_viruses.fa S7_8_virus_map
bowtie2 -x S7_8_virus_map \
        -1 S7-8_1.trimmed.fastq.gz \
        -2 S7-8_2.trimmed.fastq.gz \
        -S S7_8_virus_map.sam
        
bowtie2-build final_viruses.fa V2_virus_map
bowtie2 -x V2_virus_map \
        -1 V2_1.trimmed.fastq.gz \
        -2 V2_2.trimmed.fastq.gz \
        -S V2_virus_map.sam
        
bowtie2-build final_viruses.fa W1_4_virus_map
bowtie2 -x W1_4_virus_map \
        -1 W1-4_1.trimmed.fastq.gz \
        -2 W1-4_2.trimmed.fastq.gz \
        -S W1_4_virus_map.sam  
