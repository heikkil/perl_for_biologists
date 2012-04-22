#!/usr/bin/env perl

use v5.10; # this is how you enable new features
$a = 9;
given( $a ){ # the value is put in $_
    when( [4..6] ) { say "few"   }
    when( [2..3] ) { say "couple"}
    when( [1..1] ) { say "one"   }
    when( not $_ ) { say "none"  }
    default        { say "many"  }
}
