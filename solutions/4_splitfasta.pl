#!/usr/bin/env perl

use strict;
use warnings;
#use diagnostics;
use Getopt::Long;

use constant PROGRAMME_NAME => 'splitfasta.pl';
use constant VERSION => '0.2';

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
my $INPUT = shift;
open(IN, $INPUT) || die ("Cannot open $INPUT. $!");

if ($OUTPUT) {
    open(OUT, ">$OUTPUT") || die ("Cannot open $OUTPUT");
} else {
    *OUT = *STDOUT;
}

# variables
my $seq = "";   # sequence residues
my $header;     # contents of the header llne
my $id;         # seq id from the $header
my $seqcounter; # segment count
my $start;      # pointer to the original seq loc

while (<IN>) {
    chomp;
    if (/^>/) {
        # the header line starts a new sequence

        # print out last residues from previous seq
        print OUT ">$id-", $seqcounter++, " start=$start\n$seq\n" if $seq;

        $header = $_;
        ($id) = $header =~ /(\w+)/;
        $seq = '';
        $seqcounter = 0;
        $start = 1;
    } else {
        s/[^a-zA-Z]//g;
        $seq .= $_;
    }

    while (length($seq) >= $SEGMENT_LENGTH) {
        #substr EXPR,OFFSET,LENGTH,REPLACEMENT
        my $seqment = substr $seq, 0, $SEGMENT_LENGTH, '';
        print OUT ">$id-", $seqcounter++,
	    " overlap=$OVERLAP_LENGTH start=$start end=".
	    ($start+$SEGMENT_LENGTH-1). "\n".
	    "$seqment\n";

        # deal with overlap
        if ($OVERLAP_LENGTH) {
            $seq = substr($seqment, -1*$OVERLAP_LENGTH, $OVERLAP_LENGTH)
		. $seq;
        }
        $start = $start + $SEGMENT_LENGTH - $OVERLAP_LENGTH;

    }
}
# print out last residues from previous seq
print OUT ">$id-", $seqcounter++, " start=$start\n$seq\n" if $seq;



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

The lenght of the overlap between subsequent sequences. Defaults to 1,000.


=back


=head1 VERSION HISTORY

  0.0.0, 27 Feb 2007, start of the project
  0.2.0, 27 Feb 2007, first public version
  0.3.0, 28 Feb 2007, more documentation public version

=head1 TODO

- more docs into description

=head1 BUGS

Please report bugs to the author.

=head1 LICENSE

You may distribute this program under the same terms as perl itself.

=head1 AUTHOR

Heikki Lehvaslaiho, heikki a sanbi ac za

=head1 CONTRIBUTORS

no contributors, yet

=cut
