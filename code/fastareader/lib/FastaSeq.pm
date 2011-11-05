#!/usr/bin/env perl

package FastaSeq;
#use Mo qw'build default builder coerce is required';
use Mo;
has id => ();
has descr => ();
has seq => ();
sub length {
    my $self = shift;
    return length($self->seq);
}
1;
