#!/usr/bin/env perl

package FastaSeq;
#use Mo qw'build default builder coerce is required';
use Mo;
has id => ();
has descr => ();
has seq => ();
1;

package ReadFasta;
#use Mo;
use Mo qw'build';
use autodie;

has infile => ();
has fh => ();

sub BUILD {
    my $self = shift;
    my $F;
    open $F, "<", $self->infile;
    $self->fh($F);
}

sub next_line {
    my $self = shift;
    my $F = $self->fh;
    while (<$F>) {
        return $_;
    }
}

sub next_seq {
    my $self = shift;
    my $F = $self->fh;
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

package main;
use Modern::Perl;
use Data::Dumper;

my $seq = FastaSeq->new(id => 'A1');
$seq->seq('atcg');
#print Dumper $seq;

my $in = ReadFasta->new(infile => 't/test.fa');
#while (my $s = $in->next_line()) {
#    print $s;
#}
while (my $s = $in->next_seq()) {
    #print Dumper $s;
    print ">", $s->id, " ", $s->descr, "\n";
    print $s->seq, "\n";
}
#print Dumper $in;
