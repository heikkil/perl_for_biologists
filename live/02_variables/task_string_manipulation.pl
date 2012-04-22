#!/usr/bin/env perl

my $s = "jeddah";
print "$s\n";
chop $s;
print "$s\n";
$s = ucfirst $s;
print "$s\n";
substr $s, 1, 1, 'i';
print "$s\n";
