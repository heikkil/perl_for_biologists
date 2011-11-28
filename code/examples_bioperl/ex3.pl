#!/usr/bin/env perl
# ex3.pl
use strict;
use Bio::SeqIO;
my $in = new Bio::SeqIO(-format => 'swiss',
			-file   => 'BOSS_DROME.sp');
my $seq = $in->next_seq();
my $species = $seq->species;
print "Organism name: ", $species->common_name, " ",
    "(", $species->genus, " ", $species->species, ")\n";
my ($ref1) = $seq->annotation->get_Annotations('reference');
print $ref1->authors,"\n";
foreach my $feature ( $seq->top_SeqFeatures ) {
    print $feature->start, " ",$feature->end, " ", $feature->primary_tag, "\n";
}
