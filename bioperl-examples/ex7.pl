# ex7.pl
use Data::Dumper;
use Bio::DB::Registry 1.2; # needs bioperl release 1.2.2 or later
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
