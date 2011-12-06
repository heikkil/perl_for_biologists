#!/usr/bin/env perl
use Modern::Perl;

# go through every line in the input file
while (<>) {

    # using sequence version as the ID
    # print second word on the line
    # add fasta header key character to the output
    print ">$1" if /^ID +(\S+);/;

    # finish the output line with the DE line
    say " $1" if /^DE +(.+)/;

    if (/^  /) { # sequence line
        s/\d+//; # remove digits
        s/ //g;  # global removal of spaces
        print;   # print the remaining characters
    }
}

=pod

* 2. Sequence converter in plain perl

Write a program that reads in a file containing an EMBL sequence
file, parses its contents line by line and prints out a FASTA
formatted text into STDOUT. Use the data/ar.embl file and the sequence
version as the id.

- *Aim*: Know how to use '(<>)' construct and regular expressions to
  select parts of the line and to do changes to it.

- *FASTA file format*: The id line starting with '>' followed by one
  word ID, and multi word optional description. Fields are separated
  by a space character. Multiple sequence lines follow; no spaces or
  numbers, no fixed line length.

=cut
