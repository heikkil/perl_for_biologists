#!/usr/bin/env perl
use Modern::Perl;

sub gc_count {
    my $line = shift;
    return $line =~ tr/[GCgc]/ /;
}

my $id;
my $length;
my $gc;

while (<>) {
    chomp;
    if (/^> ?(\w+)/) {
	say "$id : ". 100* $gc /$length if $id;
	$id = $1;
    } else {
	$gc += gc_count($_);
	$length += length($_)
    }
}

say "$id :". 100* $gc /$length if $id;
