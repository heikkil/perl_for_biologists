# ex3.pl
use Modern::Perl; use Bio::SeqIO;
my $in = new Bio::SeqIO(-format => 'swiss',
                        -file => 'BOSS_DROME.sp');
my $seq = $in->next_seq();
my $species = $seq->species;
say "Organism name: ", $species->common_name, " ",
    "(", $species->genus, " ", $species->species, ")";
my ($ref1) = $seq->annotation->get_Annotations('reference');
say $ref1->authors;
foreach my $feature ( $seq->top_SeqFeatures ) {
    say $feature->start, " ",$feature->end, " ",
	$feature->primary_tag;
}
