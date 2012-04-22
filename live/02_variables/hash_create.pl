#!/usr/bin/env perl

use Data::Dumper; # standard perl module

my @array = qw( bread 5 milk 3 butter 1);
print Dumper \@array;
my %hash = @array;
print Dumper \%hash;

# special syntax for hashes
%hash2 = (cheese => 2, meat => 'no bones');
print Dumper \%hash2;

# access a value
print "Buy ", $hash{bread}, " breads\n";

# any key can be assigned a value and will come to existance
# this is known as auto-vivification
$hash{apples} = 6;
$hash{pears} = undef;

my $var; #undef
