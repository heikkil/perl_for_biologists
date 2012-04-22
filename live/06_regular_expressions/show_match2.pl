#!/usr/bin/env perl

use v5.10;
sub show_match ($$) {
   my $s = shift;
   my $rx = shift;
   $s =~ /$rx/;
   say "|$1|$2|";
}

show_match "  One  two three, 1 22 333", '(\d+\W+)(\w+)$';

use v5.10;
sub show_match ($$) {
   my $s = shift;
   my $rx = shift;

   while ($s =~ /$rx/gi) {
     say pos $s, ": |$1|";
   }
}

show_match "One two three, 1 22 333", '(\w.{3})';
