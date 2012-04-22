#!/usr/bin/env perl

{ # code block limits the extend of local declaration of a global variable
  local $/ = "\/\/\n";
  open my $SEQ, '<', shift;
  while (<$SEQ>) {
    my $seq = $_; 
    my ($ac) = $seq =~ /AC +(\w+)/;  
    say "$.: ", $ac if $seq =~ /FT +CDS/;
  }
}
