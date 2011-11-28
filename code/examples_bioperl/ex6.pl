#!/usr/bin/env perl
# ex6.pl
use strict;
use Bio::DB::GenBank;
use Bio::DB::SwissProt;
use Bio::DB::GenPept;
use Bio::DB::EMBL;
use Bio::SeqIO;

my $out = new Bio::SeqIO(-file => ">remote_seqs.embl",
			 -format => 'embl');
my $db = new Bio::DB::SwissProt();
my $seq = $db->get_Seq_by_acc('7LES_DROME');
$out->write_seq($seq);
$db = new Bio::DB::GenBank();
$seq = $db->get_Seq_by_acc('AF012924');
$out->write_seq($seq);
$db = new Bio::DB::GenPept();
$seq = $db->get_Seq_by_acc('CAD35755');
$out->write_seq($seq);
