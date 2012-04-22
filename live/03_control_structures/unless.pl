#!/usr/bin/env perl

use v5.10;
$a = '';
# leaving an empty code block look strange:
if ($a) {
} else {
   say '$a is empty';
}
# better get rid of it:
if (not $a) {
   say '$a is empty';
}
# more fluently:
unless ($a) {
   say '$a is empty';
}
# even easier to read with the transposed order of elements
say '$a is empty' unless $a;
# note the lack of parenthesis
