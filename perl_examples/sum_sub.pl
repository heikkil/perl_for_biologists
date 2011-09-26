#!/usr/bin/perl
use Modern::Perl;
sub version; #sum_sub.pl
say 'version';
say version;

sub add1 {
    my $one = shift;
    my $two = shift; 	
    my $sum = $one + $two;
    return $sum;
}

sub add ($$) {
    shift() + shift();
}

my $sum = add1(2,3);
$sum = add 2, 3;
say $sum;
sub version {'1.0'};

