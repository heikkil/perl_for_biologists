#!/usr/bin/env perl

use v5.10;
my $a = 'value';
say $a;
my $a_ref = \$a; # read \ as "reference to"

# dereferencing is done by repeating the type of the original
# variable
say ${$a_ref};   # "evaluate in scalar context"
say $$a_ref;     # shorter syntax

# how do you know what kind is the referred value?
my @a; my $array_ref = \@a;
my %a; my $hash_ref = \%a;

say ref $a_ref;
say ref $array_ref;
say ref $hash_ref;
