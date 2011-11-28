#!/usr/bin/perl -w
use strict;
use Bio::SearchIO;
use Math::BigFloat;
my $cutoff = Math::BigFloat->new('0.001');
my %files = ( 'blast' => 'BOSS_Ce.BLASTP',
	      'fasta' => 'BOSS_Ce.FASTA');
while( my ($format,$file) = each %files ) {
    my $in = new Bio::SearchIO(-format => $format,
			       -file   => $file);
    while( my $r = $in->next_result ) {
	print "Query is: ", $r->query_name, " ", $r->query_description," ",
	$r->query_length, " aa\n";
	print " Matrix was ", $r->get_parameter('matrix'), "\n";
	while( my $h = $r->next_hit ) {
	    last unless  Math::BigFloat->new($h->significance) < $cutoff;
	    print "Hit is ", $h->name, "\n";
	    while( my $hsp = $h->next_hsp ) {
             print " HSP Len is ", $hsp->length('total'), " ",
             " E-value is ", $hsp->evalue, " Bit score ", $hsp->score, " \n", 
             "   Query loc: ",$hsp->query->start, " ", $hsp->query->end,"\n",
             "   Sbject loc: ",$hsp->hit->start, " ", $hsp->hit->end,"\n";
            }
        }
    }
    print "--\n";
}
