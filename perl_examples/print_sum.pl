#!/usr/bin/perl
# print_sum.pl
use warnings;
use strict;

print "Give a number ";
my $num = <STDIN>;
my $num2 = '0.5';
my $float = $num + $num2;
my $res = 'Sum';

# print the sum
print "$res is $float\n";
