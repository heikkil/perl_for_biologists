#!/usr/bin/env perl

use v5.10;
sub show_match ($$) {
   my $s = shift;
   my $rx = shift;
   $s =~ /$rx/;
   say "|$1|";
}

show_match "One two three ", '([te].*[te])';
