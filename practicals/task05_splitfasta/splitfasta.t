# ; -*- mode: CPerl; -*-  for Emacs
#
# Run this with
#
#   prove -vl splitfasta.t
#

use Test::Simple tests => 5;

print "# I'm testing ", `./splitfasta.pl -v`, "\n";

ok `./splitfasta.pl --segment 10 --overlap 0 test.fa| grep -c ">"` == 4,
    'overlap 0';
my $seqs = `./splitfasta.pl --segment 10 --overlap 2 test.fa`;
my ($firstseqname) = $seqs =~ />([\w-]+)/;
ok $firstseqname, 'testseq-0';
ok ((scalar grep {/^>/} split (/\n/, $seqs)) == 5,
    'overlap 2');
ok `./splitfasta.pl --segment 10 --overlap 5 test.fa` =~ tr/>/>/ == 8,
    'overlap 5';
ok `./splitfasta.pl --segment 10 --overlap 9 test.fa` =~ tr/>/>/ == 32,
    'overlap 9';
