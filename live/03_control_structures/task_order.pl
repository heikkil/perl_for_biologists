#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;

my @a;
my $n = 1;
while ($n) {
    print "Give a positive integer or nothing: ";
    $n = <STDIN>;
    chomp $n;
    # next unless $n =~ /^[0-9]+$/;
    # say STDERR "|$n|";  # for debugging
    push @a, $n;
}

say STDOUT join " ", sort {$a <=> $b} @a;
