#!/usr/bin/env perl

use v5.10;
use strict; use warnings;
use autodie;

my $file = shift; # read the first argument;
open my $IN,  "<",  $file;
open my $OUT, ">",  "$file.out";
open my $LOG, ">>", "$file.log";

while (<$IN>) {
    # modify the line and print it to $out
    chomp;
    say $OUT scalar reverse;    
}

say $LOG scalar localtime. "\tran programme $0";
