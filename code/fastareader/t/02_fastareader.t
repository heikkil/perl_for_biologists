#; -*- mode: CPerl;-*-
use Test::More tests => 9;

require FastaSeq;
require_ok ('ReadFasta');

my $in = ReadFasta->new(infile => 't/test.fa');
isa_ok $in, 'ReadFasta';
can_ok 'ReadFasta', qw'infile next_seq';
my $seq = $in->next_seq;
isa_ok $seq, 'FastaSeq';
is $seq->length, 12, 'seq length';
$seq = $in->next_seq;
isa_ok $seq, 'FastaSeq';
is $seq->length, 24, 'seq length';
$seq = $in->next_seq;
isa_ok $seq, 'FastaSeq';
is $seq->length, 36, 'seq length';

