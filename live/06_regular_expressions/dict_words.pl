#!/usr/bin/env perl

use v5.10;
#use autodie;
sub show_matches ($) {
    my $rx = shift;
    open my $F, "<", "/usr/share/dict/words";
    while (<$F>) {
        print if /$rx/i;
    }
}
  
show_matches '((\w)\2){3}';
say;
show_matches '((\w(\w))\3){3}';
say;
show_matches '(.(.))(.\2){4}';
