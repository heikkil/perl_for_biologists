#!/usr/bin/env perl
use Modern::Perl;
use Bio::SeqIO;

my $infile = shift;

my $in  = Bio::SeqIO->new(-file => $infile ,
                          -format => 'EMBL');
my $out = Bio::SeqIO->new(-format => 'Fasta');

while ( my $seq = $in->next_seq() ) {
    $out->write_seq($seq);
}


=pod


* 5. Bioperl sequence converter

Write an EMBL to FASTA converter with BioPerl. Run it with file
data/ar.embl and compare the output to the one you created in
exercise 2.

- Aim: Use BioPerl to solve bioinformatics problems.

- Hint: Read Bio::SeqIO documentation using perldoc

=cut
