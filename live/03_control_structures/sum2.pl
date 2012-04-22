#!/usr/bin/env perl

use v5.10;
sub sum2 {
    my $first = shift;
    my $second = shift;
    my $sum = $first + $second;
}
say sum2(2,3); # parenthesis needed
