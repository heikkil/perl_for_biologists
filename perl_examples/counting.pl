#!/usr/bin/perl
use Modern::Perl; # counting.pl 
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
say "$alph: $c ";
