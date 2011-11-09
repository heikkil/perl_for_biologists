#!/usr/bin/env perl
use Modern::Perl;
use Data::Dumper;

use Bio::PrimarySeq;
use Bio::SeqIO;

# Bio::PrimarySeq
my $seq = Bio::PrimarySeq->new(id => 'A1');
$seq->seq('atcg');
print Dumper $seq;

# Bio::SeqIO
# note the dash in front of 'file'
my $in = Bio::SeqIO->new(-file => 't/test.fa');

while (my $s = $in->next_seq()) {
    #print Dumper $s;
    say ">", $s->id, " ", $s->desc;
    say $s->seq;
    say "length = ", $s->length;
}
