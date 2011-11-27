#! /bin/bash

echo Run this bash script
echo

echo now running the embl2fasta converter...
./task02_embl2fasta.pl ../../data/ar.embl > ar.fasta
echo results are stored in ./ar.fasta
echo
echo comparing the fasta files
echo the output should be empty between the --- lines
echo  --------------------------------
diff ../../data/ar.fasta ar.fasta | head
echo  --------------------------------
