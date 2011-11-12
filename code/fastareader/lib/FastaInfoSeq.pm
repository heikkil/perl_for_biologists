
package FastaInfoSeq;
use Mo;
extends 'FastaSeq';

sub info {
    my $self = shift;

    my $info;
    my $desc = $self->desc;
    while ($desc =~ /(\w+)=(\w+)/g) {
	$info->{$1} = $2;
    }
    return $info;
}
1;
