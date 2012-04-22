#!/usr/bin/env perl

my $aa = '1';
print "This is $aa\n";
print "This is ${aa}st\n"; # just like in BASH
$b = "${aa}st";
$b = $aa. "st";  # identical to above line
