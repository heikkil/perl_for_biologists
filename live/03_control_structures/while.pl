#!/usr/bin/env perl

use v5.10;
my $a = 3;
while ($a) {
    say $a;
    $a--;
}

use v5.10;
my @a = 'a' .. 'g';
while (@a) {
    my $rand = int(rand(10));
    if ($rand <5) {
       say "$rand ", (shift @a);
    } else {
        say "$rand ", (pop @a);
    }
}
