#!/usr/bin/perl
use Modern::Perl;

sub first_is_longer { #longer.pl
    my ($lref1, $lref2) = @_;

    $first = @$lref1; #length
    $sec = @$lref2; # length
    ($first > $sec) ? 1 : 0;
}

say "Yes" if first_is_longer(
    \('A' .. 'P'), \('H' .. 'R') );
