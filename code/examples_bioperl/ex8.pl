#!/usr/bin/env perl
# ex8.pl
Use Modern::Perl;
use Bio::SearchIO;
use Math::BigFloat;
my $cutoff = Math::BigFloat->new('0.001');
my %files = ('blast' => 'BOSS_Ce.BLASTP',
             'fasta' => 'BOSS_Ce.FASTA');
while ( my ($format,$file) = each %files ) {
    my $in = new Bio::SearchIO(-format => $format,
			       -file => $file);
    while ( my $r = $in->next_result ) {
	say "Query is: ", $r->query_name, " ",
	    $r->query_description," ",$r->query_length," aa";
	say "Matrix was ", $r->get_parameter('matrix');
	while ( my $h = $r->next_hit ) {
	    last unless Math::BigFloat->new($h->significance) < $cutoff;
	    say "Hit is ", $h->name;
	    while ( my $hsp = $h->next_hsp ) {
		# see next slide
	    }
	}
	print "--\n";
    }
}
