#!/usr/bin/env perl

use Modern::Perl;
use Data::Dumper;
use autodie;

use MRS::Client;
use Bio::SeqIO;

sub string2seq ($$) {
    my $record = shift; # scalar containing one sequence record
    my $format = shift; # Bio::SeqIO format string

    open my $fh, '<', \$record;
    my $stream = Bio::SeqIO->new(-fh     => $fh,
				 -format => $format);
    return $stream->next_seq;
}

my $client = MRS::Client->new ( host => 'mrs.cbrc.kaust.edu.sa');

# say  $client->db ('uniprot')->find ('os:human')->count;
# say "Databases:";
# map { say $_->id } $client->db;

my $query = $client->db('uniprot')->find('ac:P22815');
while (my $seq = string2seq($query->next, 'swiss')) {
    print $seq->id, " ";
    say $seq->desc;
}


=pod

This script demonstrates the use of MRS::Client on CBRC, KAUST MRS server.

Also, it wraps MRS queries in a function that creates BioPerl
Bio::SeqI objects from strings returned by the MRS client.

The syntax used to open a filehandle to a string is supported by Perl
since 5.8.0 as stated in Perl FAQ:

  perldoc -q 'filehandle to a string'

alias mrsclient='mrsclient -H mrs.cbrc.kaust.edu.sa'

=cut

