#!/usr/bin/env perl

my ($y, $x) = ("aaa", "bbb");
print "$x $y\n";
($y, $x) = ($x, $y);
print "$x $y\n";
