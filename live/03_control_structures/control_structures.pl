#!/usr/bin/env perl

use v5.10;
for ( 1 .. 3 ) {
    say $_; # values get assigned to default variable
}

use v5.10;
my @countdown = reverse 1 .. 3;
foreach my $count (@countdown ) {
    say $count; 
}
say "Boom!"

use v5.10;
my %hash = qw( bread 10 milk 3 butter 1 );
for my $item (sort keys %hash) {
    printf " %-7s # %2s\n",  $item, $hash{$item};
}

use v5.10;
my $a = 3;
while ($a) {
    say $a;
    $a--;
}
