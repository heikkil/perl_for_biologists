#!/usr/bin/env perl
# parse_blast.pl
use strict;
use Bio::SearchIO;
my $in = new Bio::SearchIO(-format => 'blast');

while( my $result = $in->next_result ) {
    while( my $hit = $result->next_hit ) {
	print $hit->name, "\n";
	while( my $hsp = $hit->next_hsp ) {
	    print $hsp->hit_string, "\n";
	}
    }
}
