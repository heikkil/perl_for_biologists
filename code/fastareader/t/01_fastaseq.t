use lib './lib';
use Test::More tests => 7;

require_ok ('FastaSeq');

my $s = FastaSeq->new;
isa_ok $s, 'FastaSeq';
can_ok 'FastaSeq', qw'id descr seq length';
ok $s->id('A') eq 'A', "id()";
ok $s->descr('acme') eq 'acme', "descr()";
ok $s->seq('actg') eq 'actg', "seq()";
ok $s->length() == 4, "length()";
