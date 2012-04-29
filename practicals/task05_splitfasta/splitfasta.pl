#!/usr/bin/env perl
use Modern::Perl;
#use diagnostics;
use Getopt::Long;
use autodie;

use constant PROGRAMME_NAME => 'splitfasta.pl';
use constant VERSION => '0.6';

my ($OUTPUT, $SEGMENT_LENGTH, $OVERLAP_LENGTH) = (undef, 10000, 1000);
GetOptions(
    'v|version'          => sub{ print PROGRAMME_NAME, ", version ", VERSION, "\n";
				 exit(1); },
    'h|help|?'           => sub{ exec('perldoc',$0); exit 0 },
    'o|output'           => \$OUTPUT,
    's|segment_length:i'  => \$SEGMENT_LENGTH,
    'l|overlap_length:i'  => \$OVERLAP_LENGTH
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
my $start = 0;  # pointer to the original seq loc

while (<$IN>) {
    chomp;
    if (/^>/) {
        # the header line starts a new input sequence

        # print out to new output sequence the
	# last residues from previous input seq
	# but only if we are really a new sequence
        print OUT ">$id-", $seqcounter++, " start=$start end=",
	    length($seq), " overlap=$OVERLAP_LENGTH\n$seq\n" if $seq and length($seq) > $start;

	# read in the ID to $id
        $header = $_;
        ($id) = $header =~ /^>\s*(\S+)/;
	# reset the $seq to empty
        $seq = '';
	# $seqcounter is reset to 0
        $seqcounter = 0;
	# start counting residies form 1
        $start = 1;
    } else { # store sequence in $seq
	# remove all non-residue characters
        s/[^a-zA-Z]//g;
        $seq .= $_;
    }

    # while input seq is long enough
    while (length($seq) >= $SEGMENT_LENGTH) {

	# extract $SEGMENT_LENGTH long region out of the input seq
        #use: substr EXPR,OFFSET,LENGTH,REPLACEMENT
        my $seqment = substr $seq, 0, $SEGMENT_LENGTH, '';

	# print out a new FASTA sequence
	# name is "$id-$seqcounter"
        print OUT ">$id-", $seqcounter++,
	    " start=$start end=".
	    ($start+$SEGMENT_LENGTH-1). " overlap=$OVERLAP_LENGTH\n".
	    "$seqment\n";

        # deal with overlap, if defined
	# copy $OVERLAP_LENGTH segment from the end of the just printed sequence
	# and prepend it back the $seq
        if ($OVERLAP_LENGTH) {
            $seq = substr($seqment, -1*$OVERLAP_LENGTH, $OVERLAP_LENGTH)
		. $seq;
        }

	# keep track what is the new start location
        $start = $start + $SEGMENT_LENGTH - $OVERLAP_LENGTH;

    }
}
# print out last residues from previous seq
# but only if there is more than the lenght of the overlap
print OUT ">$id-", $seqcounter++, " start=$start end=",
    ($start+length($seq)-1), " overlap=$OVERLAP_LENGTH\n$seq\n" if length($seq) > $OVERLAP_LENGTH;




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
    if the sequence is longer that overlap length


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
  0.6.0, 23 Apr 2012, print last frament only if it is longer than overlap

=head1 TODO

- more docs into description

=head1 BUGS

Please report bugs to the author.

=head1 LICENSE

You may distribute this program under the same terms as perl itself.

=head1 AUTHOR

Heikki Lehvaslaiho, heikki lehvaslaiho gmail com

=head1 CONTRIBUTORS

Martin Senger, detected the bug fixed in v0.6

=cut
