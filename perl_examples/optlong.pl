#!/usr/bin/perl
use Modern::Perl;
use GetOpt::Long;

use constant PROGRAMME_NAME => 'optlong.pl';
use constant VERSION => '0.1';

our $DEBUG = '';
our $DIR = '.';

GetOptions
  ('v|version'  => 
    sub{print PROGRAMME_NAME, ", version ",
        VERSION, "\n"; exit 1; },
   'd|directory:s'=> \$DIR,
   'g|debug'      => \$DEBUG,
   'h|help|?'     => 
   sub{exec('perldoc',$0); exit 0} 
  );
