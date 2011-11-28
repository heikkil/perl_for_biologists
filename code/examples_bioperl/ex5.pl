#!/usr/bin/env perl
# ex5.pl
use Modern::Perl;
use Bio::Seq;
use Bio::SeqFeature::Generic;
use Bio::SeqIO;
my $seq = new Bio::Seq(-seq => 'TVASTTDDEVVATGLTAAILGLIATLAILVFIVV',
                       -display_id  => 'BOSSfragment',
                       -desc => 'pep frag');
my $f= new Bio::SeqFeature::Generic(-seq_id => 'BOSSfragment',
                                    -start  => 10,
                                    -end    => 25,
				    -source => 'hand_curated',
				    -primary => 'TRANSMEMBRANE',
				    -tag => {
                                      'note' => 'putative transmembrane'
                                     });
$seq->add_SeqFeature($f);
my $out = new Bio::SeqIO(-format => 'genbank');
$out->write_seq($seq);
