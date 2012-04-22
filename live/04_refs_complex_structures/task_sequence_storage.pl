#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use Data::Dumper; # Data::Printer 
my $DEBUG = 1;

my @seqs =
    ("Q4X180\tPutative lipase atg15\tMKSSRKRTKRR",
     "A7A179\tSterol 3-beta-glucosyltransferase\tMPITQIISASD",
     "Q8S929\tCysteine protease ATG4a\tMKALCDRFVPQ");

# create the data stucture to hold sequence information
my $seqs;
for (@seqs) {
    my ($id, $descr, $seq) = split "\t";
    say "($id, $descr, $seq)" if $DEBUG;

    # building first a hash and adding a reference 
    # to that hash into out data structure ($seqs)

    my %this_seq;
    $this_seq{id} = $id;
    $this_seq{descr} = $descr;
    $this_seq{seq} = $seq;
    print Dumper \%this_seq;
    $seqs->{$id} = \%this_seq;
    print Dumper $seqs;
    
    # doing the same thing at one go
    #$seqs->{$id}->{descr} = $descr;
    #$seqs->{$id}->{seq} = $seq;

    print Dumper $seqs;
}

# call information from the data structure
say $seqs->{A7A179}->{descr};
