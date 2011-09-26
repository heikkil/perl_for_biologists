#!/usr/bin/perl
use Modern::Perl;

sub first_is_longer { #longer.pl
    my ($lref1, $lref2) = @_;

    my $first = @$lref1; #length
    my $sec = @$lref2; # length
    ($first > $sec) ? 1 : 0;
}

my @a = ('A' .. 'P');
my @b = ('H' .. 'R');
say "Yes" if first_is_longer(\@a, \@b );
