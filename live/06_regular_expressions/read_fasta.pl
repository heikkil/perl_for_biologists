#!/usr/bin/env perl

#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use autodie;
use Data::Dumper; # Data::Printer 
my $DEBUG = 1;

# unused subroutined do not trigger warnings
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


sub parse_idline {
    my $line = shift;
    my ($id, $descr) = $line =~ /^>(\w+) (.+);/;
    my %this_seq;
    $this_seq{id} = $id;
    $this_seq{descr} = $descr;
    return \%this_seq;
}

sub read_file {
    my $file = shift;
    # create the data structure to hold sequence information
    my $seqs;
    # open the file
    open my $F, "<", $file;
    my $new_seq;
    while (<$F>) {
        chomp;
        if (/^>/) {
            $seqs->{$new_seq->{id}} = $new_seq if $new_seq;
            $new_seq = parse_idline($_);
        } else { # sequence line!
            $new_seq->{seq} .= $_;
        }
    }
    $seqs->{$new_seq->{id}} = $new_seq if $new_seq;
    print Dumper $seqs;
    return $seqs;
}


# main part of the programme
my $file = 'seq.fasta';
my $seqs = read_file($file);

# call information from the data structure
say $seqs->{A7A179}->{descr};
say $seqs->{A7A179}->{seq};
