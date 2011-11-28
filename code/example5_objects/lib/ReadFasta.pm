
package ReadFasta 0.1;
#use Mo;
use Mo qw'build';
use autodie;
use FastaSeq;

has infile => ();

my $F;
sub BUILD {
    my $self = shift;
    open $F, "<", $self->infile;
}

sub next_line {
    my $self = shift;
    while (<$F>) {
	return $_;
    }
}

sub next_seq {
    my $self = shift;
    local $/ = "\n>";
    while (<$F>) {
#	return "<|$_|>";
	return unless $_;
	my $entry = $_;
#	print $entry;
	my ($id) = $entry =~ /^>? *(\w*)/;
	my ($desc) = $entry =~ /^>? *\w* ?(.*)\n/;
	my ($str) = $entry =~ /^.*?\n(.*)/s;
	$str =~ s/\W//g;
#	print "$id\n";
	my $seq = FastaSeq->new (id => $id);
	$seq->desc($desc) if $desc;
	$seq->seq($str) if $str;
	return $seq;
    }
}

1;

__END__

=pod

=head1 NAME

ReadFasta - FASTA sequence input class

=head1 SYNOPSIS

  my $seq = FastaSeq->new(id => 'A1');
  $seq->desc('gn=abc tax=9606');
  $seq->seq('atcg');
  my $seqinfo = $seq->info;
  say $seqinfo->{tax}; # 9606

=head1 DESCRIPTION

This is a demonstration Object Oriented class to use simplest possible
Moose like syntax.

ReadFasta is has a class variable infile that stores the name of teh
input FASTA file. It uses extended Mo feature 'build' to ammend the
default Mo contructor.

FastaInfoSeq is a subclass of FastaSeq that knows about key/value
pairs as part of the FASTA description. Method info() returns a
hashref of key/value pairs.

The method next_line() is for demonstration purposes. The real work is
done in method next_seq() that reads the file and returns a FastaSeq object.

This mimics the BioPerl method Bio::SeqIO::next_seq().

=head1 AUTHOR

=head1 VERSION

v. 0.1, 2011-11-24

Heikki Lehvaslaiho, heikki a bioperl.org

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

