#!/usr/bin/perl
use Modern::Perl;
# file2.pl
my $file = '/tmp/a';
die "Not writable" unless -w $file;
open my $LOG, '>>', $file or die $!;
my $params;
print STDERR "log: $params\n";
print $LOG "$params\n";

local $/ = "\/\/\n";
open my $SEQ, '<', shift or die $!;
while (<$SEQ>) {
    my $seq = $_; 
    my ($ac) = $seq =~ /AC +(\w+)/;  
    print "$ac\n" if $seq =~ /FT +CDS/;
}
