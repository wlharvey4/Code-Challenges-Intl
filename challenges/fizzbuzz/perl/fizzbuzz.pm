#!/usr/bin/env perl5

# Code-Challenges-Intl/challenges/fizzbuzz/perl/fizzbuzz.pm
# =============================================================================
# CREATED: 2018-05-20
# UPDATED: 2018-10-24
# VERSION: 3.0.0
# AUTHOR : wlharvey4
# USAGE  : perl5 fizzbuzz.pm <n>
# ABOUT  : fizzbuzz in Perl
# NOTES  : Module B is the Perl Compiler!! What a surprise to get 425 public
#	 : methods mixed into my B module.
# CHANGE_LOG:
# .............................................................................
# version 2.1.0 2018-09-07
# -- added package identifier;
# -- converted into a modulino, callable as either a module or a script
# .............................................................................
# version 3.0.0 2018-10-24T21:30
# -- complete refactor into Perl OO style with full double dispatch for
#    equality checking; no reflection in OO;
# .............................................................................
# version 3.0.1 2018-10-24T10:05
# -- revised some comments;
# -- revised switch statement to remove unnecessary statements;
# -----------------------------------------------------------------------------

# GLOBAL DEPENDENCIES
# .............................................................................
use strict;
use warnings;
use v5.16;





package Fizzbuzz;

# PACKAGE CONSTANTS
my $USAGE    = qq{USAGE: ./fizzbuzz [-v] <integer> 
option -v increases verbosity level\n};

# Fizzbuzz->fizzbuzz({n => <n>}) ==> Fizzbuzz object
# .............................................................................
# Fizzbuzz constructor;
# -----------------------------------------------------------------------------
# @_ := {n => <n>} where <n> is some positive integer
# ==> Fizzbuzz object

sub fizzbuzz {
    my $class = shift;
    my $params   = shift;
    my ($n, $cc);

    $n  = $params->{n};
    $cc = calculate($n);

    bless {n => $n, cc => $cc}, $class;
}

# calculate(n) ==> FBN
# .............................................................................
# Function to calculate the Fizzbuzz of an integer
# -----------------------------------------------------------------------------
# @_ := n
# ==> one of N of int | FZ | BZ | FZBZ

sub calculate{
    my $n = shift;

    my $fizz = !($n % 3);
    my $buzz = !($n % 5);

    return
	$fizz && $buzz ? FZBZ->new() :
	$fizz || $buzz ? $fizz ? FZ->new() : BZ->new() :
	N->new($n);
}

# params() ==> n
# .............................................................................
# Attribute accessor for 'params', the input parameters of the code challenge
# -----------------------------------------------------------------------------
# @_ = () | (n)
# ==> n

sub params {
    my $self = shift;
    $self->{n} = shift if @_;
    $self->{n};
}

# cc() ==> FBN
# .............................................................................
# Attribute accessor for 'cc', the calculated value of the code challenge
# -----------------------------------------------------------------------------
# @_ = () | (cc)
# ==> N | FZ | BZ | FZBZ

sub cc {
    my $self = shift;
    $self->{cc} = shift if @_;
    $self->{cc};
}

# eq(other) ==> 0 | 1
# .............................................................................
# It  is  impossible  to tell  what  type  $self  or  $other is  without  doing
# reflection; therefore, utilize double dispatch to resolve the equality of two
# Fizzbuzz values.  However, in order to accommodate the test runner `check.pm'
# sending over  an `expected' value  for checking equality, reflect  on whether
# $self is an object (i.e., a Fizzbuzz) or not (i.e., an `expected'); if not an
# object,  call the  FBN constructor  to wrap  this `expected'  value in  a FBN
# subclass object and then proceed with checking for equality.
# -----------------------------------------------------------------------------
# @_ := (Fizzbuzz | Expected)
# ==> 0 | 1

sub eq {
    my $self = shift;
    my $other= shift;
    my $o;

    # Obtain the correct other value, whether a cc or an expected
    if (ref($other)) { # if a ref, then it is a cc value
	$o = $other->cc();
    } else {           # if not, then it is an expected; need to wrap it
	$o = FBN->new($other);
    }
    # Obtain the underlying reference Fizzbuzz value
    my $fbn = $self->cc();

    # This call starts the double dispatch equality resolution
    $fbn->eq($o);
}

# inspect(verbosity)
# .............................................................................
# View the internals of a Fizzbuzz
# -----------------------------------------------------------------------------
# @_ := () | -v
# 	     -v := increase verbosity (use Data::Printer)
# ==> print object internals

sub inspect {
    my $self = shift;
    my ($n, $cc) = ($self->params(), $self->cc());
    
    print "Fizzbuzz of $n is ", $cc->value(), "\n";

    if (@_ && $_[0] eq '-v') {
	Data::Printer::p($self);
	$cc->inspect(-v) if $cc;
    }
}

# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE FIZZBUZZ





# PACKAGE FBN
# .............................................................................
# Parent class: provides inspection and equality methods

package FBN {

    # FBN->new(expected)
    # -------------------------------------------------------------------------
    # FBN constructor  for constructing  an FBN from  an `expected'  value sent
    # from  the test  runner  `check.pm'.  This  uses  pattern matching  (since
    # `expected' is not an object).
    # -------------------------------------------------------------------------
    # @_ := <n> | 'fizz' | 'buzz' | 'fizzbuzz'
    # ==> N of <n> | FZ | BZ | FZBZ
    
    sub new {
	my $class = shift;
	my $expected = shift;

        SWITCH:
        for ($expected) {
	    if ( /^\d+$/ )         { return N   ->new($expected) }
	    if ( /^$FZ::FZ$/ )     { return FZ  ->new()          }
	    if ( /^$BZ::BZ$/ )     { return BZ  ->new()          }
	    if ( /^$FZBZ::FZBZ$/ ) { return FZBZ->new()          }
	    else { die "Invalid value for expected: $expected\n" }
	}
    }

    # value->() ==> int | string
    # .....................................
    # Attribute reader of an FBN value
    # -------------------------------------
    # @_ := ()
    # ==> int | string

    sub value {
	my $self = shift;
	$$self;
    }

    # inspect->()
    # .....................................
    # Pretty-printer for this FBN
    # -------------------------------------
    # @_ := () | -v
    #            -v := increase verbosity (use Data::Printer)
    # ==> innards

    sub inspect {
	my $self = shift;

	if (@_ && $_[0] eq '-v') {
	    Data::Printer::p($self);
	} else {
	    print $self->value(), "\n";
	}
    }

    # eq() ==> 0 | 1
    # .....................................
    # Initiate double dispatch to resolve
    # the equality of two FBN's
    # -------------------------------------
    # @_ := ($self: ?, $other: ?)
    # ==> 0 | 1

    sub eq {
	my $self = shift;
	my $other = shift;
	$self->eql($other);
    }
}
# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE FBN





# PACKAGE N < FBN
# .............................................................................
# encapsulates an integer <n>
# N->new(n)

package N {
    use parent -norequire, "FBN";

    # N->new()
    # .....................................
    # N Constructor
    # -------------------------------------
    # @_ := n
    # ==> N object

    sub new {
	my $class = shift;
	my $n = shift;
	bless \$n, $class;
    }

    # eql(other) ==> 0 | 1
    # .....................................
    # Second dispatch
    # -------------------------------------
    # @_ := ($self: N, $other: ?)
    # ==> 0 | 1

    sub eql {
	my $self = shift;
	my $other= shift;
	$other->eqN($self);
    }

    # eqN(N) ==> 0 | 1
    # .....................................
    # Resolution of double dispatch, two N
    # types
    # -------------------------------------
    # @_ := ($self: N, $other: N)
    # ==> 0 | 1

    sub eqN {
	my $self = shift;
	my $other= shift;
	$self->value() == $other->value();
    }

    # eqFZ(FZ) ==> 0
    # .....................................
    # Resolution of double dispatch, one N
    # type, one non-N type
    # -------------------------------------
    # @_ := ($self:N, $other:FZ), where $other is type FZ
    # ==> 0

    sub eqFZ {
	0;
    }

    # eqBZ(BZ) ==> 0
    # .....................................
    # Resolution of double dispatch, one N
    # type, one non-N type
    # -------------------------------------
    # @_ := ($self:N, $other:BZ), where $other is type BZ
    # ==> 0

    sub eqBZ {
	0;
    }

    # eqFZBZ(FZBZ) ==> 0
    # .....................................
    # Resolution of double dispatch, one N
    # type, one non-N type
    # -------------------------------------
    # @_ := ($self:N, $other:FZBZ), where $other is type FZBZ
    # ==> 0

    sub eqFZBZ {
	0;
    }
}
# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE N





# PACKAGE FZ < FBN
# .............................................................................
# encapsulates a 'fizz'
# FZ->new()

package FZ {
    use parent -norequire, "FBN";
    our $FZ = "fizz";

    # FZ->new()
    # .....................................
    # FZ Constructor
    # -------------------------------------
    # @_ := ()
    # ==> FZ Object

    sub new {
	my $class = shift;
	bless \$FZ, $class;
    }

    # eql(other)
    # .....................................
    # Second dispatch
    # -------------------------------------
    # @_ := ($self:FZ, $other: ?)
    # ==> 0 | 1

    sub eql {
	my $self = shift;
	my $other = shift;
	$other->eqFZ($self);
    }

    # eqFZ(FZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self:FZ, $other: FZ)
    # ==> 1

    sub eqFZ {
	1;
    }

    # eqBZ(BZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self:FZ, $other:BZ)
    # ==> 0

    sub eqBZ {
	0;
    }

    # eqFZBZ(FZBZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self:FZ, $other:FZBZ)
    # ==> 0

    sub eqFZBZ {
	0;
    }

    # eqN(N)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self:FZ, $other: N)
    # ==> 0

    sub eqN {
	0;
    }
}
# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE FZ





# PACKAGE BZ < FBN
# .............................................................................
# encapsulates a 'buzz'
# BZ->new()

package BZ {
    use parent -norequire, "FBN";
    our $BZ = "buzz";

    # BZ->new()
    # .....................................
    # BZ Constructor
    # -------------------------------------
    # @_ =: ()
    # ==> BZ
    
    sub new {
	my $class = shift;
	bless \$BZ, $class;
    }

    # eql(other)
    # .....................................
    # Second dispatch
    # -------------------------------------
    # @_ := ($self: BZ, $other: ?)
    # ==> 0 | 1

    sub eql {
	my $self = shift;
	my $other = shift;
	$other->eqBZ($self);
    }

    # eqBZ(BZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: BZ, $other: BZ)
    # ==> 1

    sub eqBZ {
	1;
    }

    # eqFZ(FZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: BZ, $other: FZ)
    # ==> 0

    sub eqFZ {
	0;
    }

    # eqFZBZ(FZBZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: BZ, $other: FZBZ)
    # ==> 0

    sub eqFZBZ {
	0;
    }

    # eqN(N)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: BZ, $other: N)
    # ==> 0

    sub eqN {
	0;
    }
}
# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE BZ





# PACKAGE FZBZ < FBN
# .............................................................................
# encapsulates a 'fizzzbuzz'
# FZBZ->new()

package FZBZ {
    use parent -norequire, "FBN";
    our $FZBZ = "fizzbuzz";

    # FZ->new()
    # .....................................
    # FZ Constructor
    # -------------------------------------
    # @_ := ()
    # ==> FZ

    sub new {
	my $class = shift;
	bless \$FZBZ, $class;
    }

    # eql(FBN)
    # .....................................
    # Second dispatch
    # -------------------------------------
    # @_ := ($self: FZBA, $other: ?)
    # ==> 0 | 1

    sub eql {
	my $self = shift;
	my $other= shift;
	$other->eqFZBZ($self);
    }

    # eqFZBZ(FZBZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: FZBZ, $other: FZBZ)
    # ==> 1

    sub eqFZBZ {
	1;
    }

    # eqFZ(FZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: FZBZ, $other: FZ)
    # ==> 0

    sub eqFZ {
	0;
    }

    # eqBZ(BZ)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: FZBZ, $other: BZ)
    # ==> 0

    sub eqBZ {
	0;
    }

    # eqN(N)
    # .....................................
    # Resolution of double dispatch
    # -------------------------------------
    # @_ := ($self: FZBZ, $other: N)
    # ==> 0

    sub eqN {
	0;
    }
}
# /////////////////////////////////////////////////////////////////////////////
# END PACKAGE FZBZ





# PACKAGE MAIN: main()
# .............................................................................
# @_ := @ARGV (as below)
sub main {
    my $verbosity = '';
    if (@_ && $_[0] eq '-v') { $verbosity = shift }

    unless (@_) {
	print $USAGE;
	exit -1;
    }

    my $n1 = shift;
    my $fb1 = Fizzbuzz->fizzbuzz({ n => $n1 });
    $fb1->inspect($verbosity);

    unless (@_) { print STDERR "all done\n"; exit 0 }

    my $n2 = shift;
    my $fb2 = Fizzbuzz->fizzbuzz({ n => $n2 });
    $fb2->inspect($verbosity);

    print "Fizzbuzz of $n1 and $n2 are ", $fb1->eq($fb2) ? "equal" : "not equal";
    print "\n";
}

# ./fizzbuzz <n1> [<n2>]
# .............................................................................
# MODULINO
# If this module is called from the command-line, then invoke the main()
# function; otherwise, this module is being called from another script, such as
# ./check, and this code and main() are simply ignored.
# -----------------------------------------------------------------------------
# @ARGV := ( <n1> [<n2>] ) where <n1> and <n2> represent some positive integers
# ==> printed results

main(@ARGV) unless caller();

1;
__END__
