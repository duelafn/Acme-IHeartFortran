#!/usr/bin/perl
use strict; use warnings;
use Test::More tests => 5;
use lib 'lib';

BEGIN{ use_ok 'Acme::IHeartFortran' };

is 1 .EQ. 1, 1, "equality true";
is 1 .EQ. 2, 0, "equality false";
is 1 .NE. 1, 0, "inequality true";
is 1 .NE. 2, 1, "inequality false";
