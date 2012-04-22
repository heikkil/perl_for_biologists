#!/usr/bin/env perl

use v5.10;
$counting_up = 1;
while (1) {
    say "doing stuff";
    $counting_up++;
    last if $counting_up == 3;
}
