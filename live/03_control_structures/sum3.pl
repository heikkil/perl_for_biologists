#!/usr/bin/env perl

use v5.10;
my $DEBUG = 0;
sub sum3 ($$) {  # exactly two scalars needed
    say "inside sum3" if $DEBUG;
    shift() +  shift(); # parenthesis needed here
}
say sum3 2,3;
say sum3 4,5;
