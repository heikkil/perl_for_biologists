#!/usr/bin/env perl

use v5.10; 
# this is a common usage
$n = 2;
printf "I have %d dog%s.\n", $n,
          ($n == 1) ? "" : "s";
# This is better done using normal if:
$a = 'think';
$a eq 'make' ? (say "making...") : (say "Skipping making.");
