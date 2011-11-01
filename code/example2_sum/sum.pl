#!/usr/bin/env perl
# example2_sum/sum.pl
use Modern::Perl;

print "Give a number: ";
my $num = <STDIN>;

my $num2 = '0.5';
my $float = $num + $num2;

# print the sum
my $res = 'Sum';
print "$res is $float\n";
