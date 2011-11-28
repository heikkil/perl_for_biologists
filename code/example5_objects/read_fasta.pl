#!/usr/bin/env perl
use Modern::Perl;
use Data::Dumper;
use lib './lib';
#say "@INC";

use FastaSeq;
use ReadFasta;

my $seq = FastaSeq->new(id => 'A1');
$seq->seq('atcg');
print Dumper $seq;

my $in = ReadFasta->new(infile => 't/test.fa');

while (my $s = $in->next_seq()) {
    #print Dumper $s;
    say ">", $s->id, " ", $s->descr;
    say $s->seq;
    say "length = ", $s->length;
}
