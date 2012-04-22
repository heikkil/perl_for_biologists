#!/usr/bin/env perl

use strict;
my $state = 'outside'; # will not compile without 'my'
print "Out : $state", "\n";
{
    my $state = 'inside';
    print "In : $state", "\n"; 
}
print "Out: $state", "\n";
