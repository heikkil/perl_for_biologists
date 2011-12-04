#! /bin/bash

echo Run this bash script
echo

echo now running the bioperl embl2fasta converter...
./task05_bioperl_seqconverter.pl ../../data/ar.embl > ar.fasta
echo results are stored in ./ar.fasta
echo
echo Top three lines from ar.fasta:
head -3 ar.fasta
echo
