#!/usr/bin/env perl

use v5.10;

sub sum4 {
    my %args = @_;
    my $one = $args{one} || 0;
    my $two = $args{two} || 0;
    return $one + $two;
}

say sum4(one => 2,
         two => 3);
say sum4(two => 4);
