#!/usr/bin/env perl
use Modern::Perl;
#use diagnostics;
use Getopt::Long;
use autodie;

use constant PROGRAMME_NAME => 'splitfasta.pl';
use constant VERSION => '0.5';

my ($OUTPUT, $SEGMENT_LENGTH, $OVERLAP_LENGTH) = (undef, 10000, 1000);
GetOptions(
    'v|version'          => sub{ print PROGRAMME_NAME, ", version ", VERSION, "\n";
				 exit(1); },
    'h|help|?'           => sub{ exec('perldoc',$0); exit 0 },
    'o|output'           => \$OUTPUT,
    's|segmentlength:i'  => \$SEGMENT_LENGTH,
    'l|overlaplength:i'  => \$OVERLAP_LENGTH
);


# ---------------------------------------
# open input file and output file
# input comes from a file
my $INPUT = shift;
open my $IN, "<", $INPUT;

# if output file has not been given, print to STDOUT
# filehandle OUT is used in both cases
if ($OUTPUT) {
    open(OUT, ">$OUTPUT");
} else {
    *OUT = *STDOUT;
}

# variables
my $seq = "";   # sequence residues
my $header;     # contents of the header line
my $id;         # seq id from the $header
my $seqcounter; # segment count
my $start;      # pointer to the original seq loc

while (<$IN>) {
    chomp;
    if (//) {
        # the header line starts a new input sequence

        # print out to new output sequence the
	# last residues from previous input seq


	# read in the ID to $id


	# reset the $seq to empty

	# $seqcounter is reset to 0

	# start counting residies form 1

    } else { # store sequence in $seq
	# remove all non-residue characters


    }

    # while input seq is long enough


	# extract $SEGMENT_LENGTH long region out of the input seq
        #use: substr EXPR,OFFSET,LENGTH,REPLACEMENT


	# print out a new FASTA sequence
	# name is "$id-$seqcounter"





        # deal with overlap, if defined
	# copy $OVERLAP_LENGTH segment from the end of the just printed sequence
	# and prepend it back the $seq





	# keep track what is the new start location


    }
}
# print out last residues from previous seq




=head1 NAME

splitfasta.pl - split a fasta sequence into overlapping seqments

=head1 SYNOPSIS

B<splitfasta.pl> [B<-v|--version> | [B<-?|-h|--help>] |
  B<[-s|--segment_length> value] B<[-l|--overlap_length> value
  inputfastafile


=head1 DESCRIPTION

This program will allow you to read a fasta sequence and split it into
a number of overlapping sequences.

=head2 PSEUDOCODE

  read in line {
     if on a header, print out the rest of the prev seq
     store the header or add residues to seq
     repeat until false {
         if the length of the split seq has been read in
             create a new sequence and print it
         if overlap has been defined, take it from printed
             segment and add it back to seq
    }
  }
  create a new sequence and print rest of the residues


=head1 INSTALLING

There are no external dependencies to this program. Just use a
reasonably recent perl (> 5.6) and you will be fine.

=head1 RUNNING

You run the program by changing the options and giving it a fasta file
name to work on.

=head1 OPTIONS

=over 7

=item B<-v | --version>

Print out a line with the program name and version number.

=item B<-? | -h | --help>

Show this help.

=item B<-s|--segment_length> value

The lenght of the new sequences. Defaults to 10,000.

=item B<-s|--overlap_length> value

The length of the overlap between subsequent sequences. Defaults to 1,000.


=back


=head1 VERSION HISTORY

  0.0.0, 27 Feb 2007, start of the project
  0.2.0, 27 Feb 2007, first public version
  0.3.0, 28 Feb 2007, more documentation public version
  0.4.0,  1 Oct 2011, modernize
  0.5.0, 27 Oct 2011, more code comments

=head1 TODO

- more docs into description

=head1 BUGS

Please report bugs to the author.

=head1 LICENSE

You may distribute this program under the same terms as perl itself.

=head1 AUTHOR

Heikki Lehvaslaiho, heikki lehvaslaiho gmail com

=head1 CONTRIBUTORS

no contributors, yet

=cut
