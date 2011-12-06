#!/usr/bin/env perl
use Modern::Perl;

# Create an array of three letter abbreviations of English month
# names.  Loop over the elements of the array and assign each month
# its corresponding ordinal. Demonstrate that calling $months{'Jan'}
# and $months{'Dec'} print out the correct ordinal number.


my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my %months;
my $count = 1;
foreach my $month_name (@months) {
    $months{$month_name} = $count;
    $count++;
}

say "Ordinal of January is ", $months{'Jan'};
say "Ordinal of December is ", $months{'Dec'};

