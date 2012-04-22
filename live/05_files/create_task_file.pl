#!/usr/bin/env perl
use strict;
use warnings;
use v5.10;

# usage: ./create_task_file.pl > seq.tab

my @seqs =
("Q4X180\tPutative lipase atg15\tMKSSRKRTKRR",
"A7A179\tSterol 3-beta-glucosyltransferase\tMPITQIISASD",
"Q8S929\tCysteine protease ATG4a\tMKALCDRFVPQ"
);

say for @seqs;
