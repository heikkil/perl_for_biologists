#!/usr/bin/env perl

$state = 'outside';
{
    my $state = 'inside';
    print "In : $state", "\n" 
}
print "Out: $state", "\n"
