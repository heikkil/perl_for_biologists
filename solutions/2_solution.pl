#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

sub date_a {
    my $date =`date`;
    my ($mon, $day, $year) = $date =~ /\w+ +(\w+) +(\d+).+(\d{4})/;
    #print "($mon, $day, $year)";

    return "$day-$mon-$year";
}

print date_a, "\n";


my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my %months;
my $count = 1;
foreach (@months) {
    $months{$months[$count-1]} = $count;
    $count++;
}
#print Dumper \%months;
#exit;
sub date_b  {

    my $date =`date`;
    my ($mon, $day, $year) = $date =~ /\w+ +(\w+) +(\d+).+(\d{4})/;

    return sprintf "%4d-%02d-%02d", $year, $months{$mon}, $day;
}

print date_b, "\n";
#exit;

sub date_c  {
    my %arg =  @_;
    print Dumper \%arg;
    my $date =`date`;
    my ($mon, $day, $year) =
                #  Thu   Mar    22 16:18:55 SAST 2007
        $date =~ /^\w+ +(\w+) +(\d+).+(\d{4})/;

    if ($arg{format} eq 'ISO') {
        return sprintf "%4d-%02d-%02d", $year, $months{$mon}, $day;
    } else {
        return "$day-$mon-$year";
    }
}

print date_c(format => "ISO"), "\n";
print date_c(format => "xxx"), "\n";
