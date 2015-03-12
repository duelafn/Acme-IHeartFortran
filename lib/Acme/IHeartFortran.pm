package Acme::IHeartFortran;
use strict; use warnings;
require Exporter;
our @ISA = qw( Exporter );
our @EXPORT = qw/ LT LE EQ NE GT GE AND OR XOR EQV NEQV /;

use overload '.' => \&_do_op;

sub _do_op {
  my ($self, $y, $reverse) = @_;
  $$self{ $reverse ? 'left' : 'right' } = $y;
  if (exists($$self{left}) and exists($$self{right})) {
    return $$self{op}->(@$self{qw/ left right /});
  }
  return $self;
}


sub new {
  my ($class, $op) = @_;
  bless { op => $op }, $class;
}

sub LT() { __PACKAGE__->new( sub { $_[0] <  $_[1] ? 1 : 0 } ) }
sub LE() { __PACKAGE__->new( sub { $_[0] <= $_[1] ? 1 : 0 } ) }

sub EQ() { __PACKAGE__->new( sub { $_[0] == $_[1] ? 1 : 0 } ) }
sub NE() { __PACKAGE__->new( sub { $_[0] != $_[1] ? 1 : 0 } ) }

sub GT() { __PACKAGE__->new( sub { $_[0] >  $_[1] ? 1 : 0 } ) }
sub GE() { __PACKAGE__->new( sub { $_[0] >= $_[1] ? 1 : 0 } ) }

# sub NOT()  { __PACKAGE__->new( sub { $_[0] == $_[1] ? 1 : 0 } ) }
sub AND() { __PACKAGE__->new( sub { $_[0] && $_[1] ? 1 : 0 } ) }
sub OR()  { __PACKAGE__->new( sub { $_[0] || $_[1] ? 1 : 0 } ) }
sub XOR() { __PACKAGE__->new( sub { $_[0] ^  $_[1] ? 1 : 0 } ) }

sub EQV()  { __PACKAGE__->new( sub { $_[0] == $_[1] ? 1 : 0 } ) }
sub NEQV() { __PACKAGE__->new( sub { $_[0] != $_[1] ? 1 : 0 } ) }
