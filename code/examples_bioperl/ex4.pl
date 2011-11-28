#!/usr/bin/env perl
# ex4.pl
use strict;
use Bio::SeqIO;
my $in = new Bio::SeqIO(-format => 'genbank', -file => 'in.gb');
my $out = new Bio::SeqIO(-format => 'fasta', -file => '>out.fa');
while( my $seq = $in->next_seq ) {
    next unless $seq->desc =~ /hypothetical/i;
    $out->write_seq($seq);
}
