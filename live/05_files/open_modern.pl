#!/usr/bin/env perl

use v5.10;
use strict; use warnings;
use autodie;
  
{ # code block to automatically close the filehandle in the end
    open my $F, "<", "input.txt";
    while (<$F>) {
        print;
    }
}
