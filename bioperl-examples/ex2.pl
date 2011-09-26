#!/usr/bin/perl -w
use strict;
use Bio::PrimarySeq;
my $seq = new Bio::PrimarySeq(-seq => 'ATGGGACCAAGTA',
			      -id  => 'example1');

print "seq length is ", $seq->length, "\n";
print "translation is ", $seq->translate()->seq(), "\n";
