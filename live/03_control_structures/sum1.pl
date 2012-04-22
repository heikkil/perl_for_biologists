#!/usr/bin/env perl

use v5.10;
sub sum1 {
    my ($first, $second) = @_;  # @_ = default array
    my $sum = $first + $second;
    return $sum;
}
say sum1(2,3,4);
