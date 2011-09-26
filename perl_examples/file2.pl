#!/usr/bin/perl
use Modern::Perl;
# file2.pl
die "Not writable" unless $file -w;
open my $LOG, '>>', $file or die $!;
print STDERR "log: $params\n";
print $LOG "$params\n";

local $/ = "\/\/\n";
open my $SEQ, '<', shift or die $!;
while (<$SEQ>) {
    my $seq = $_; 
    my ($ac) = $seq =~ /AC +(\w+)/;  
    print "$ac\n" if $seq =~ /FT +CDS/;
}
