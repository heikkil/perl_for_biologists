#!/usr/bin/env perl

use v5.10;
my @list1 = qw( 3 5 7);
my @list2 = qw( 9 2 4 5);

sub count_arrays {
    return scalar @_;
}

say count_arrays (@list1, @list2);
