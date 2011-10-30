# hello.t
use Test::Simple tests => 1;
ok( `./hello.pl` eq "Hello!\n", "output" );
