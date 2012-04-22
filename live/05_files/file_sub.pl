#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use autodie;
use Data::Dumper; # Data::Printer 
my $DEBUG = 1;


sub parse_line {
    my $line = shift;
    #say;
    my ($id, $descr, $seq) = split "\t", $line;
    say "($id, $descr, $seq)" if $DEBUG;
    
    # building  a hash 
    
    my %this_seq;
    $this_seq{id} = $id;
    $this_seq{descr} = $descr;
    $this_seq{seq} = $seq;
    print Dumper \%this_seq;

    # returning a reference to this hash
    return \%this_seq;
}


sub read_file {
    my $file = shift;
    # create the data structure to hold sequence information
    my $seqs;
    # open the file
    open my $F, "<", $file;
    while (<$F>) {
        chomp;
        my $new_seq = parse_line($_);
        $seqs->{$new_seq->{id}} = $new_seq;
        #print Dumper $seqs;
    }
    return $seqs;
}


# main part of the programme
my $file = 'seq.tab';
my $seqs = read_file($file);

# call information from the data structure
say $seqs->{A7A179}->{descr};
