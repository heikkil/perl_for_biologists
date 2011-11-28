#!/usr/bin/perl -w
use strict;
use Bio::SeqIO;

my $in = new Bio::SeqIO(-format => 'genbank', -file => 'AB077698.gb');
while( my $seq = $in->next_seq ) {
  print "Sequence length is ", $seq->length(), "\n";
  my $sequence = $seq->seq();  
  print "1st ATG is at ", index($sequence,'ATG')+1, "\n";
  print "features are: \n";
  foreach my $f ( $seq->top_SeqFeatures ) {
      printf("  %s %s(%s..%s)\n",$f->primary_tag,
	     $f->strand < 0 ? 'complement' : '',
	     $f->start, $f->end);
  }
}
