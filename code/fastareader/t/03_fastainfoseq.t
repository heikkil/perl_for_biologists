#; -*- mode: CPerl;-*-
use Test::More tests => 9;

require_ok ('FastaInfoSeq');

my $s = FastaInfoSeq->new;
isa_ok $s, 'FastaSeq';
isa_ok $s, 'FastaInfoSeq';
can_ok 'FastaInfoSeq', qw'id desc seq length info';
ok $s->id('A') eq 'A', "id()";
ok $s->desc('gn=abc tax=9606') eq 'gn=abc tax=9606', "desc()";
ok $s->seq('actg') eq 'actg', "seq()";
ok $s->length() == 4, "length()";
my $info = $s->info;
TODO: {
    local $TODO =  'info() needs implementation';
    ok $info->{tax} eq '9606', 'info()';
}
