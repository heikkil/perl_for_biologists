#!/usr/bin/env perl

use strict;
use warnings;

use Bio::SeqIO;

my $infile = shift;

my $in  = Bio::SeqIO->new(-file => $infile ,
                          -format => 'EMBL');
my $out = Bio::SeqIO->new(-format => 'Fasta');

while ( my $seq = $in->next_seq() ) {
    $out->write_seq($seq);
}

