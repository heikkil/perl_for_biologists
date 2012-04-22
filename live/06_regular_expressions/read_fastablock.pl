#!/usr/bin/env perl

#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use autodie;
use Data::Dumper; # Data::Printer 
my $DEBUG = 1;


sub read_file {
    my $file = shift;

    # redefine the input record separator
    local $/ = '>';

    # create the data structure to hold sequence information
    my $seqs;

    # open the file
    open my $F, "<", $file;

    my $new_seq;
    while (<$F>) {

        # take care of the edge conditions
        next if m/^>$/;
        s/>$//;
        #say "|$_|";

        # parse ID and description
        my ($id, $descr) = $_ =~ /(\w+) (.*)/;
        say "($id, $descr)";

        # read the sequence
        my ($seq) = $_ =~  /[^\n]+(.*)/s;
        $seq =~ s/\n//g;

        # store them in a hash ref
        my $new_seq;
        $new_seq->{id} = $id;
        $new_seq->{descr} = $descr;
        $new_seq->{seq} = $seq;

        # add the sequence info into $seqs collection hash ref
        $seqs->{$id} = $new_seq;

    }
    #$seqs->{$new_seq->{id}} = $new_seq if $new_seq;
    print Dumper $seqs;
    return $seqs;
}


# main part of the programme
my $file = 'seq.fasta';
my $seqs = read_file($file);

# call information from the data structure
say $seqs->{A7A179}->{descr};
say $seqs->{A7A179}->{seq};
