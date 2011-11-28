#!/usr/bin/env perl
# ex7.pl
use Modern::Perl;
use Data::Dumper;
use Bio::DB::Registry;

my $registry = Bio::DB::Registry->new;
#print Dumper $registry;
# $registry->services
my $db = $registry->get_database('embl');
#print Dumper $db;
# get_Seq_by_{id|acc|version}
my $seq = $db->get_Seq_by_acc("J02231");
if ($seq) {
    print $seq->seq,"\n";
} else {
    print " No sequence retrieved\n";
}
