#!/usr/bin/env perl

my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
my @three = reverse sort @months[ -1..1 ];
print "@three";
