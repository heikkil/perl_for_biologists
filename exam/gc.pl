#!/usr/bin/env perl
use Modern::Perl;

sub gc_count {
    my $line = shift;

}

my $id;
my $length;
my $gc;

while (<>) {

    # The fasta header line is the special case
    if (//) {


    } else {
	$gc += gc_count($_);

    }
}


=pod

Add perl code to this file to create a program that counts the GC% of
each fasta entry given to it.

When you run it:

  ./gc.pl test.fa

It hould print out:

  testseq: 50%

When you are done, copy the file into your studentN home directory in
the remote computer.

=cut
