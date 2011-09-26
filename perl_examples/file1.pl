#!/usr/bin/perl
use Modern::Perl;

print "Hello\n"; # file1.pl
print STDOUT "Hello\n"; # identical
my $file = 'seq.embl';
die "Not exist" unless -e $file;
die "Not readable" unless -r $file;
open FH, $file or die $!;
while (<FH>) { chomp; print;}
close FH;
{
  open my $F, '>', $file or die $!;
  while (<$F>) {
      chomp; 
      # do
  }
}
