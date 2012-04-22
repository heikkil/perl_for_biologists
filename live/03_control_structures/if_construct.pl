#!/usr/bin/env perl

$a = 8;
if ($a >= 4 and $a < 7) {
    print "few\n";
} elsif ($a >= 2 && $a < 4) {
    print "couple\n";
} elsif ($a == 1 ) {
    print "one\n";
} elsif ( not $a ) { # same as: $a == undef || $s == 0
    print "none\n";
} else {
    print "many\n";
}
