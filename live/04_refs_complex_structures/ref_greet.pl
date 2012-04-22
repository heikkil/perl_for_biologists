#!/usr/bin/env perl

use v5.10;
sub greet {
    my $greeting = "Hello!";
    say $greeting;
}
my $g = \&greet;
$g->();

my $g2 = sub {$n = shift; say "Hello, $n"};
$g2->('you');
