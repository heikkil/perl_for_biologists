#!/usr/bin/env perl
# example4_counting/counting.pl
use Modern::Perl;
my $alph = 'atgc';
say length($alph);
my @alph = split '', $alph;
print "$#alph\n";
print scalar(@alph), "\n";
my $c = 0;
foreach (@alph) {
    say "$c: ", $alph[$c], $_;
    $c++;
    my $alph = 'augc';
}
say "$alph: $c";
