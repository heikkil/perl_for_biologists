#!/usr/bin/env perl

my $name = 'heikki';
print ucfirst($name), " is ", length($name), " characters long\n";
# more: uc(), lc()
# see: perldoc -f substr
print substr($name, 3, 2), " are the two consonants in the middle of $name\n";
# substr can be used to do inplace modifications of strings, too
substr $name, 0, 1, uc(substr $name, 0, 1);
print "$name\n";
