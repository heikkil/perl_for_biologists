#!/usr/bin/env perl

use v5.10;
@ls = split "\n", `ls *pl`;
say "files: ", "@ls";

for my $plfile (@ls) {
   say `rev.sh < $plfile`;
}
