#!/usr/bin/env perl
# ex1.pl
use Modern::Perl;
use Bio::SeqIO;

my $in = new Bio::SeqIO(-format => 'genbank', -file => 'AB077698.gb');
while( my $seq = $in->next_seq ) {
    say "Sequence length is ", $seq->length();
    my $sequence = $seq->seq();
    say "1st ATG is at ", index($sequence,'ATG')+1;
    say "features are:";
    foreach my $f ( $seq->top_SeqFeatures ) {
	printf("  %s %s(%s..%s)\n",$f->primary_tag,
	       $f->strand < 0 ? 'complement' : '',
	       $f->start, $f->end);
    }
}
