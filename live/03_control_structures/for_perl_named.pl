#!/usr/bin/env perl

use v5.10;
my @countdown = reverse 1 .. 3;
foreach my $count (@countdown ) {
    say $count; 
}
say "Boom!"
