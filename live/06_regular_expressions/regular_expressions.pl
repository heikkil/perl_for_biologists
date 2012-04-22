#!/usr/bin/env perl

use v5.10;
$_ = "AUCAGAUCGCAU";
say if /AUC/;  # match
s/U/T/g;       # substitute
tr/A-Z/a-z/;   # transliterate
say;

use v5.10;
my $name = 'Heikki Lehvaslaiho';
$name_rx = '[^ ]+';   # any number of non-spaces

# at one go
my ($first_name) = $name =~ /($name_rx)/;
# match first the assignment
$name =~ /([^ ]+)/;
$first_name = $1 if $1;
say "$name => $first_name";

/even/;      # literal
/^even/;     # literal, beginning of the line
/even$/;     # literal end of the line
/eve+n/;     # + means one or more e
/eve*n/;     # * means zero or more e
/eve?n/;     # ? means zero or one e
/eve{2,4}n/; # {; two to four times
/e(ve)+n/    # group for export, eveven
/0|1|2|3|4|5|6|7|8|9/ # alteration
/[0123456789]/ # character class
/[0-9]+/       # range, in ASCII
/\d+/          # digits
/e[ve]+n/      # character class, inclusive
/e[^ve]+n/     # character class, exclusive
/e.*n/         #
