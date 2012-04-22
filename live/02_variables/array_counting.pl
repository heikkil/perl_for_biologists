#!/usr/bin/env perl

my $alph = 'atgc';
print length($alph), "\n";
my @alph = split '', $alph;
print "$#alph\n";               # index of last element
print scalar(@alph), "\n";      # scalar context => number of elements
my $c = 0;
foreach (@alph) {
    print "$c: ", $alph[$c], $_, "\n";  # special variable $_; sigil shift!
    $c++;
    my $alph = 'augc';          # using the enclosure
}
print"$alph: $c ($_)", "\n";
