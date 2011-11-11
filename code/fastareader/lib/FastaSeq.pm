
package FastaSeq;
use Mo;
has id => ();
has descr => ();
has seq => ();
sub length {
    my $self = shift;
    return length($self->seq);
}
1;
