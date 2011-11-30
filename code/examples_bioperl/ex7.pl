#!/usr/bin/env perl
# ex7.pl
# usage: convert_aln.pl < in.aln > out.phy
use strict;
use Bio::AlignIO;
my $in = new Bio::AlignIO(-format => 'clustalw');
my $out = new Bio::AlignIO(-format => 'phylip');
while( my $aln = $in->next_aln ) {
    $out->write_aln($aln);
}
