#!/usr/bin/env perl

use v5.10;
my %hash = qw( bread 10 milk 3 butter 1 );
for my $item (sort keys %hash) {
    printf " %-7s # %2s\n",  $item, $hash{$item};
}
