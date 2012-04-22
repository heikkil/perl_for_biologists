#!/usr/bin/env perl

use v5.10;
use Data::Dumper;
my $board;                      # scalar variable
my $piece = {color => 'white',  # hash reference
             piece => 'pawn'};

# place the pawn
$board->[0]->[1] = $piece;  # using the deference arrow
# same as:
$board[0][1] = $piece;  # autovivification

print Dumper $board;

# look up a location
my $p = $board[0][1];
print Dumper $p;
say $p->{piece};
say $board[0]->[1]->{piece};
say $board[0][1]{color};
say $board[0][0] || 'no piece on this location';
if (my $loc = $board[0][1] )  {
   say $loc->{piece}, ", ", $loc->{color};
} else {
   say 'no piece on this location';
}
