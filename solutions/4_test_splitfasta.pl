#!/usr/bin/env perl

use strict;
use Test;

BEGIN { plan tests => 5 }

print "# I'm testing ", `splitfasta.pl -v`, "\n";

ok  scalar grep {/^>/} split /\n/, `./splitfasta.pl --segment 10 --overlap 0 test.fa`, 4;

my $seqs = `./splitfasta.pl --segment 10 --overlap 2 test.fa`;
ok scalar grep {/^>/} split (/\n/, $seqs), 5;

my ($firstseqname) = $seqs =~ />([\w-]+)/;
ok $firstseqname, 'testseq-0';
ok`./splitfasta.pl --segment 10 --overlap 5 test.fa` =~ tr/>/>/, 8;
ok `./splitfasta.pl --segment 10 --overlap 9 test.fa` =~ tr/>/>/, 32;
