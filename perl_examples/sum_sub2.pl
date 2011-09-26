#!/usr/bin/perl
use Modern::Perl;

sub add2 {
    my %args = @_;
    my $one = $args{one} || 0;
    my $two = $args{two} || 0;
    my $sum = $one +$two;
    return $sum;
}

sub add ($$) {
    shift() + shift();
}

my $sum2 = add2(one => 2,
                two => 3);
my $sum = add(2,3);
