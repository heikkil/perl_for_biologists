#!/usr/bin/env perl

use v5.10;
for (1..10) {
  say $_ if $_ > 5;
}
# alternative way
map {say $_} grep {$_ > 5} 1..10;
my @aa = grep {$_ > 5} 1..10;
