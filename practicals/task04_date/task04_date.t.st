#; -*- mode: CPerl;-*-
#
# Run this with
#
#   prove -vl task04_date.t
#

use Test::Simple tests => 6;

sub date_a;
sub month_name2number;
sub date_b;
sub date_c;

print "# Perl task 2 in three parts:\n";
ok date_a(), "date_a() returns ". date_a();
ok month_name2number('Jan') == 1,
    "month_name2number('Jan') returns ". month_name2number('Jan');
ok month_name2number('Dec') == 12,
    "month_name2number('Dec') returns ". month_name2number('Dec');
ok date_b() =~ /\d{4}-\d{2}-\d{2}/ , "date_b() returns ". date_b();
ok date_c(), "date_c() returns ". date_c();
ok date_c(format => 'ISO')  =~ /\d{4}-\d{2}-\d{2}/, 
    "date_c(format => 'ISO') returns ". date_c(format => 'ISO');


sub date_a {

}

sub month_name2number {

}


sub date_b {

}

sub date_c {

}


=pod

  * 4.a. Date conversions

  Write a subroutine called date_a() that reads the current date from
  the unix \texttt{date} command output and returns it in what ever
  format you see appropriate.  Call the subroutine within the program
  to show that it works and print out the result.

  - Aim: Know how to manipulate data with regexps and how to call an
    external command line program. Encapsulation using a subroutine.

  - Note: In real world you would like to use builtin functions
    localtime() and gmtime().

  - Test: Run command and add code to subroutines inside the test
    file:

       prove -vl task02_date.t


  * 4.b. ISO date

  Make an other version of the subroutine to returns date in ISO
  format (YYYY-MM-DD, e.g. 2007-03-22).

  - Hint: Create a helper subroutine that converts names into
    numbers. Inside the subroutine, use hash to store the month names
    as keys and month numbers as values.

  - Hint: Precise text formatting can be done with sprintf().


  * 4.c. Date with arguments

  Make a third version of the date subroutine by making it possible to
  use named arguments to select the returned format. Use a default, so
  that the subroutine always returns something.

=cut
