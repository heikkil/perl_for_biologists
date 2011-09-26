#!/usr/bin/env perl

use strict;
use warnings;

# go through every line in the input file
while (<>) {
    #print if /^SV/;

    # print second word on the line, include . char
    # add fasta header key character
    print ">$1\n" if /^SV +(\S+)/;

    if (/^  /) { # sequence line
        s/\d+//; # remove digits
        s/ //g;  # global replacement of spaces
        print;   # print remaining characters
    }
}
