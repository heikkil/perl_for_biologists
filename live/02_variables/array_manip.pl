#!/usr/bin/env perl

@alph = qw(a t g c);
print "@alph\n";
push @alph, 'u';
print "@alph\n";
$last = pop @alph;
print "@alph\t$last\n";
$first = shift @alph;
print "@alph \t$first\n";
unshift @alph, $first;
print "@alph\n";
