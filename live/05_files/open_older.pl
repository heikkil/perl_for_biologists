#!/usr/bin/env perl

use strict; use warnings;
open my $fh, "<", "input.txt" or die "cannot open < input.txt: $!";
while (<>) {
    print;
}
close $f;

use v5.10;
use strict; use warnings;

my $file = 'input.txt';
say "File $file does not exist" and exit unless -e $file;
say "File $file is not readable" and exit unless -r $file;

open my $fh, "<", "input.txt" or die "cannot open < input.txt: $!";
while (<>) {
    print;
}
close $f;
