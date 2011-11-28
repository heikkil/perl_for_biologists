
package FastaInfoSeq 0.1;
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


__END__

=pod

=head1 NAME

FastaInfoSeq - FASTA sequence with description line parser

=head1 SYNOPSIS

  my $seq = FastaSeq->new(id => 'A1');
  $seq->desc('gn=abc tax=9606');
  $seq->seq('atcg');
  my $seqinfo = $seq->info;
  say $seqinfo->{tax}; # 9606

=head1 DESCRIPTION

This is a demonstration Object Oriented class to use simplest possible
Moose like syntax.

FastaInfoSeq is a subclass of FastaSeq that knows about key/value
pairs as part of the FASTA description. Method info() returns a
hashref of key/value pairs.

=head1 VERSION

v. 0.1, 2011-11-24

=head1 AUTHOR

Heikki Lehvaslaiho, heikki a bioperl.org

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

