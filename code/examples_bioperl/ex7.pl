#!/usr/bin/env perl
# ex7.pl
# you need Berkeley DB headers and perl module DB_File
use Modern::Perl;
use Data::Dumper;
use Bio::DB::Registry;

my $registry = Bio::DB::Registry->new;
#print Dumper $registry;
# $registry->services
my $db = $registry->get_database('swissprot');
#print Dumper $db;
# get_Seq_by_{id|acc|version}
my $seq = $db->get_Seq_by_acc("P09612");
if ($seq) {
    say $seq->accession, " ", $seq->desc;
    say $seq->seq;
} else {
    print " No sequence retrieved\n";
}
