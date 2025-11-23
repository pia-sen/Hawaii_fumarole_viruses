#!/bin/bash
#SBATCH -o trim_viral_contigs.%j.out
#SBATCH -e trim_viral_contigs.%j.err
#SBATCH -D .
#SBATCH -N 1
#SBATCH -t 7-00:00:00
#SBATCH -p small-gpu

fastqc ${j}_*.fastq.gz

bbduk.sh -Xmx12g ktrim=r ordered minlen=50 mink=11 tbo=t rcomp=f k=21 ow=t zl=4 \
       qtrim=rl trimq=20 \
       in1=${j}_1.fastq.gz \
        in2=${j}_2.fastq.gz \
        ref=~/tools/adapters.fa  \
        out1=${j}_1.trimmed.fastq.gz \
        out2=${j}_2.trimmed.fastq.gz

fastqc ${j}_*.trimmed.fastq.gz
