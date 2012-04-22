#!/usr/bin/env perl

#                0   1   2   3   4   5   6   7   8   9   10  11  12
my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
print join (", ", @months[0, 2, 4, 6, 7, 9, 11]), "\n";
