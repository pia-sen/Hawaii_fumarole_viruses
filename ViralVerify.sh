#!/bin/bash
#SBATCH -o vv.%j.out
#SBATCH -e vv.%j.err
#SBATCH -D .
#SBATCH -N 1
#SBATCH -t 7-00:00:00
#SBATCH -p 384gb

for f in /CCAS/home/pia_sen/metaviralspades/*.fasta; do 
/CCAS/home/pia_sen/viralVerify-1.1/bin/viralverify -f "$f" --hmm /CCAS/home/pia_sen/viralVerify-1.1/hmms/nbc_hmms.hmm -t 2 -p -o viralVerify_out_"$f"
done
