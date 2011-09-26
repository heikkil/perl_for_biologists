#!/usr/bin/perl
use Modern::Perl;

$_ = 'AC   J123; O345;';
if (/\w/) { # word_char.pl
    my $line = $_;

    # check for a  digit
    say "digit" if $line =~ /\d/;

    # should start with ID
    say "ID error: $line"
        if $line !~ /^ID/;
}
