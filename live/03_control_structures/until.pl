#!/usr/bin/env perl

use v5.10;
my $done;
$counting_up = 1;
until ($done) {
    say "doing stuff";
    $counting_up++;
    $done = 1 if $counting_up == 3;
}
