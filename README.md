
Acme::IHeartFortran
===================

Tired of the Perl operators? Long for the days of FORTRAN when life was
beautiful? Well, now you have your FORTRAN operators in Perl!

    #!/usr/bin/perl
    use strict;
    use warnings;
    use 5.010;

    use Acme::IHeartFortran;

    my $x = 1;


    if (($x .GE. 1) .AND. ($x .LE. 10)) {
        say "I ♥ FORTRAN!";
    }


This is just some old code I wrote for a PerlMonks question:
http://www.perlmonks.org/?node_id=813561

It is rather simplistic and not really complete. TODO:


 * Prefix .NOT.
   - Similarly, Booleans: .true., .false.

 * Precedence
   - .NOT.
   - .AND.
   - .OR.
   - .XOR., .EQV., .NEQV.

 * Case Insensitivity
