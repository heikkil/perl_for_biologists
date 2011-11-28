
package FastaSeq 0.2;
use Mo;
has id => ();
has desc => ();
has seq => ();
sub length {
    my $self = shift;
    return length($self->seq);
}
1;

__END__

=pod

=head1 NAME

FastaSeq - simple class for storing a FASTA format sequence

=head1 SYNOPSIS

  my $seq = FastaSeq->new(id => 'A1');
  $seq->desc('modern');
  $seq->seq('atcg');
  say $seq->length; # 4

=head1 DESCRIPTION

This is a demonstration Object Oriented class to use simplest possible
Moose like syntax.

FastaSeq is a storage class for three arguments:

=over 4

=item - identifier (id), a word after the '>' character

=item - description (descr), free text in one line

=item - sequence (seq), multi-line nucleotide or amino acid sequence

=back

Get/setter methods are defined to each attribute. An additional method
length() returns the sequence length.

The closest BioPerl equivalent is Bio::PrimarySeq, but even it has
more capabilities than this simple class.

=head1 VERSION

v. 0.2, 2011-11-24

=head1 AUTHOR

Heikki Lehvaslaiho, heikki a bioperl.org

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


