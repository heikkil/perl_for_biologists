#!/usr/bin/env perl

print abs(-2), "\n";
my $res = sqrt(2);
print int($res), " <-- $res\n";
# $res = sqrt(-2); but see CPAN for Math::Complex
print "rand: ", int(rand(10)), "\n";  # perldoc -f rand
# see perldoc -f log
