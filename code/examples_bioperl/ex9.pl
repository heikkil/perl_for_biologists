#!/usr/bin/perl -w
use strict;
use Bio::SearchIO;
use Bio::SearchIO::Writer::HTMLResultWriter;
use Math::BigFloat;

my $cutoff = Math::BigFloat->new('0.2');
my $in = new Bio::SearchIO(-format => 'blast',
			   -file   => 'BOSS_Ce.BLASTP');

my $writer = new Bio::SearchIO::Writer::HTMLResultWriter;
my $out = new Bio::SearchIO(-writer => $writer,
			    -file   => '>BOSS_Ce.BLASTP.html');
while( my $result = $in->next_result ) {
    my @keephits;
    my $newresult = new Bio::Search::Result::GenericResult
	(-query_name        => $result->query_name,
	 -query_accession   => $result->query_accession,
	 -query_description => $result->query_description,
	 -query_length      => $result->query_length,
	 -database_name     => $result->database_name,
	 -database_letters  => $result->database_letters,
	 -database_entries  => $result->database_entries,
	 -algorithm         => $result->algorithm,
	 -algorithm_version => $result->algorithm_version,	 
	 );
    foreach my $param ( $result->available_parameters ) {
	$newresult->add_parameter($param,$result->get_parameter($param));
    }
    foreach my $stat ( $result->available_statistics ) {
	$newresult->add_statistic($stat,$result->get_statistic($stat));
    }
    while( my $hit = $result->next_hit ) {
	last if Math::BigFloat->new($hit->significance) > $cutoff;
	$newresult->add_hit($hit);
    }
    $out->write_result($newresult);
}
