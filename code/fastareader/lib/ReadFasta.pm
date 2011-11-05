#!/usr/bin/env perl
package ReadFasta;
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
	my ($descr) = $entry =~ /^>? *\w* ?(.*)\n/;
	my ($str) = $entry =~ /^.*?\n(.*)/s;
	$str =~ s/\W//g;
#	print "$id\n";
	my $seq = FastaSeq->new (id => $id);
	$seq->descr($descr) if $descr;
	$seq->seq($str) if $str;
	return $seq;
    }
}

1;
