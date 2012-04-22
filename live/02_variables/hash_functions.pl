#!/usr/bin/env perl

my %hash = ( bread => 5, milk => 3, butter => 1);

# safe way to see if key exists - without autovivification
print "Bread? ", exists $hash{bread};

# does the key have a value?
print "\nBread has value? ", defined $hash{bread};

# list of keys. Unordered!
print "\nKeys: ", join " ", keys %hash;

#  how many keys?
print "\nCount of keys: ",  scalar keys %hash;

# list of values;
print "\nValues: ", join " ", values %hash;
