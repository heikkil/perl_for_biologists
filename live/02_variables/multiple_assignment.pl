#!/usr/bin/env perl

$d = $c = $b = 2;
print "$d = $c = $b";
$b = 4 + ($a = 2);  # not recommended
# do the assignments separately
$a = 2;
$b = 4 + $a;
