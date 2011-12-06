#!/usr/bin/env perl

package FastaSeq;
use strict;
use warnings;

sub new {
  my ($class, %args) = @_;
  my $self = {};
  bless $self, 'FastaSeq';

  $self->id( $args{id} ) if defined $args{id};
  $self->id( $args{descr} ) if defined $args{descr};
  $self->id( $args{seq} ) if defined $args{seq};

  return $self;
}

sub id {
  my $self = shift;
  if (@_) {
    $self->{_id} = shift;
  }
  return $self->{_id};
}

sub descr {
  my $self = shift;
  if (@_) {
    $self->{_descr} = shift;
  }
  return $self->{_descr};
}

sub seq {
  my $self = shift;
  if (@_) {
    $self->{_seq} = shift;
  }
  return $self->{_seq};
}

1;

package main;
use Data::Dumper;

my $s = FastaSeq->new(id=>'A1');
$s->descr('old example');
$s->seq('atgc');
print Dumper $s;
