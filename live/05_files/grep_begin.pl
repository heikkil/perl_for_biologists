#!/usr/bin/env perl

while (<>) {
    print if substr($_, 0, 7) eq '#+BEGIN'
}
