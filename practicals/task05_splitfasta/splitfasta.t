# ; -*- mode: CPerl; -*-  for Emacs
#
# Run this with
#
#   prove -vl splitfasta.t
#

use Test::Simple tests => 6;

print "# I'm testing ", `./splitfasta.pl -v`, "\n";

ok `./splitfasta.pl --segment 10 --overlap 0 test.fa| grep -c ">"` == 4,
    'overlap 0';
my $seqs = `./splitfasta.pl --segment 10 --overlap 2 test.fa`;
my ($firstseqname) = $seqs =~ />([\w-]+)/;
ok $firstseqname, 'testseq-0';
ok ((scalar grep {/^>/} split (/\n/, $seqs)) == 5,
    'overlap 2');
ok `./splitfasta.pl --segment 10 --overlap 5 test.fa` =~ tr/>/>/ == 7,
    'overlap 5';
ok `./splitfasta.pl --segment 10 --overlap 9 test.fa` =~ tr/>/>/ == 31,
    'overlap 9';
ok `./splitfasta.pl --segmentlength 3 --overlaplength 2 test.fa`
    =~ tr/>/>/ == 38, 'length 3, overlap 2';
