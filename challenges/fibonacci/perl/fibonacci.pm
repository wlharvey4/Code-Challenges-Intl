#! /usr/bin/env perl5

# Code-Challenges-Intl/challenges/fibonacci/perl/fibonacci.pm
# =============================================================================
# CREATED: 2018-09-07
# UPDATED: 2018-10-26
# VERSION: 2.2.1
# AUTHOR: wlharvey4
# USAGE: perl5 fibonacci.pm <n>
# CHALLENGE: Fibonacci sequence in Perl
# NOTES:
#  -- Start using package identifiers
#  -- Start making  these packages  callable either as  a module  (from another
#     package) or  a script  (from the  command line), which  has been  named a
#     `Modulino' by brian d foy;
#  -- NOTE that beginning with Perl 5.28,  it is possible to initialize a state
#     variable in list context, so when  I switch to using that version, update
#     this code to use a state @cache;
#  -- Found the `bigint' package, which  allows arbitrarily large numbers to be
#     created (limited by memory only)
#  -- Discovered  that the  message re:  `deep  recursion' is  coming from  the
#     `warnings' pragma, so it can be  quieted without issue in this case; when
#     the `bigint' pragma is activated, it sees the final `1' as a number to be
#     processed,  and  then  the  `warnings' pragma  issues  a  `void  context'
#     message; this  can be  avoided by changing  the final `1'  to a  print ""
#     statement instead.
#  -- After refactoring into  a Fibonacci class, I noticed that  when I created
#     two  independent instances  in 'main()',  they actually  shared the  same
#     cache, and the second instance was able to use the calculated values from
#     the  first instance;  this  seems wrong  to  me, and  a  violation of  OO
#     principles; I'm  not sure why it  is happening, and therefore  don't know
#     the  proper fix  for it;  as it  happens,  it is  a boon,  rather than  a
#     liability.  It  is probably happening  because they are both  sharing the
#     same @DEFAULT seed array,  come to consider it a bit  more.  There is not
#     really a good reason  to avoid the sharing, since there  is only one true
#     sequence of  Fibonacci numbers,  so a  better solution  would be  to have
#     individual instances always share, even when an option to start at (0, 0)
#     is chosen.
#  -- The Fibonacci  value of a given  term will be different  depending on the
#     initial  seed values,  unless  the  terms change  from  being 1-based  to
#     0-based.  I don't know that answer to  this question, and so will have to
#     wait until I find  one to resolve the problem.  As of  now, I use 1-based
#     sequencing starting at (1,1) for the tests.  Perhaps the answer is to say
#     that if the seed  values are (1,1), then the sequence  is 1-based, but if
#     it is (0,1), then it is 0-based.
#  -- I have decided that it makes  more sense to use the modern interpretation
#     of the sequence beginning at F0 := 0,  F1 := 1 i.e. (0, 1) instead of (1,
#     1), as  originally designed.   Therefore, I have  refactored the  code by
#     removing the option  to choose the starting cache values;  in addition, I
#     have decided to go  with the idea of using just  one "global" cache array
#     instead  of having  each object  create its  own; this  way, if  multiple
#     objects are instantiated simultaineously, they  will share one cache, and
#     a cache need not be included in the parameters of the recursive function.
# CHANGE_LOG:
# .............................................................................
# version 1.0.0 2018-09-07
# -- Initial commit
# .............................................................................
# version 1.1.0 2018-09-08
# -- Add `bigint' package;
# -- quiet  the `deep  recursion' warning  and 'void'  warning (by  using final
#    'print' instead of final '1');
# -- clean up code a bit
# .............................................................................
# version 1.2.0 2018-10-25T10:45
# -- Reformat module;
# -- add USAGE;
# -- add argument conformance check to 'main()' subroutine;
# .............................................................................
# version 2.0.0 2018-10-25T16:45
# -- Refactor into Perl OO module
# -- add optional seed parameter, allowing sequence to start at (0, 1) or
#    (1, 1); default is to start at (1, 1)
# -- adjust nth term to be 1-based instead of 0-based;
# -- in accordance with this change, I changed the JSON test table, which will
#    break every other implementation until I catch up.
# .............................................................................
# version 2.1.0 2018-10-26T02:15
# -- Refactor  to  zero-based  representation  only (remove  option  to  choose
#    between initial seed values  of the old style (1, 1)  and the modern style
#    (0, 1); just use the modern;
# -- refactor calculation  function to use  a "global" local cache  without the
#    need to include in parameters;
# -- refactor inspect() method to show cache values;
# -- adjust JSON test values to start at F0 := 0, and run 20 tests;
# -- clean up code and documentation;
# .............................................................................
# version 2.1.1 2018-10-26T02:35
# -- added note to describe reasons for last refactoring;
# .............................................................................
# version 2.2.0 2018-10-26T03:00
# -- added Fibonacci Class documentation
# .............................................................................
# version 2.2.1 2018-10-26T03:15
# -- added Global Variables section to documentation
# =============================================================================

use strict;
use warnings;
no warnings qw(recursion);
use v5.16;
use bigint;

use Data::Printer output => 'stdout';



# =============================================================================
# Fibonacci Class
# .............................................................................
# Calculate a Fibonacci sequence value, given a term
# -----------------------------------------------------------------------------
# Global Variables:
# +++++++++++++++++
# @cache : INT ARRAY -- cache  of calculated Fibonacci values, indexed by term;
#                       this  is  not   a  true  global,  but   global  to  all
#                       instantiated objects in the main() function;
# _____________________________________________________________________________
# Instance Variables:
# +++++++++++++++++++
# params : INT -- term of Fibonacci sequence to calculate
# cc     : INT -- calculated value of nth term of Fibonacci sequence
# _____________________________________________________________________________
# Instance Methods:
# +++++++++++++++++
# params() ==> INT      -- Setter and Getter
# cc()     ==> INT      -- Getter (set from within constructor)
# eq()     ==> BOOLEAN  -- Getter
# inspect()==> STRING   -- Description / Pretty-printer
# _____________________________________________________________________________
# Functions:
# ++++++++++
# main()      -- Command-line entry point
# calculate() -- Recursive function to calculate the value of a Fibonacci term
# =============================================================================

package Fibonacci;

my $USAGE = qq{\n\tUSAGE: fibonacci n (n:Int >= 0)\n\n};

# Make @cache a "global" local variable to allow sharing if multiple
# Fibonacci objects are ever instantiated simultaneously
my @cache = (0, 1); # seed values, zero-based, i.e. F0 := 0, F1 := 1

# =============================================================================
# Fibonacci->fibonacci({ n => INT }) ==> Fibonacci value for nth term
# .............................................................................
# Fibonacci constructor
# -----------------------------------------------------------------------------
# Params: hash ref of:
#     n => INT -- represents the sought-after term of the Fibonacci sequence to
#                 calculate (i.e., its nth term); n >= 0
# _____________________________________________________________________________
# ==> Fibonacci Class
#     Instance Variables:
#     -------------------
#     params: INT -- represents the term of the Fibonacci sequence to calculate
#     cc    : INT -- represents the calculated nth Fibonacci sequence term
# =============================================================================

sub fibonacci {
    my $class  = shift; die "This is a constructor" if ref $class;
    my $params = shift;
    my $self   = bless {}, $class;

    $self->params($params);
    $self->cc( calculate($self->params()) );
    $self;
    
} # END fibonacci
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# calculate( {n => INT, cache => INT array ) ==> INT
# .............................................................................
# Fibonacci recursive  subroutine (function);  accepts an  integer representing
# the nth term of the Fibonacci sequence to calculate, and an Int array holding
# prior calculated  Fibonacci sequence values, then  recursively calculates nth
# value, storing new results in its cache;
# -----------------------------------------------------------------------------
# Params: n => INT, nth term to calculate, >= 1
#         cache => INT array, stored results, where the index represents the
#                  corresponding value
# _____________________________________________________________________________
# ==> Int, value of nth Fibonacci term
# =============================================================================

sub calculate {
    my $n = shift;
    return $cache[ $n ] if scalar @cache > $n;
    return $cache[ $n ] = calculate( $n-2 ) + calculate( $n-1 );

} # END calculate()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# params()             ==> INT
# params( {n => INT} ) ==> INT
# .............................................................................
# Attribute accessor for 'params' instance  variable, representing the nth term
# of the  Fibonacci sequence  to calculate;  must be greater  than or  equal to
# zero.
# -----------------------------------------------------------------------------
# Params: undef for GETTER
#       | {n => INT} for SETTER of params; n >= 0
# _____________________________________________________________________________
# ==> INT, representing nth term of Fibonacci sequence to calculate
# =============================================================================

sub params {
    my $self = shift;
    if (@_) {
	my $params = shift;
	my $n = $params->{n};
	unless ($n >= 0) {
	    print STDERR $USAGE;
	    print STDERR
          qq{ERROR: param n must be greater than or equal to zero, not $n\n\n};
	    exit -1;
	}
	$self->{n} = $n;
    }
    $self->{n};

} # END params()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# cc()      ==> INT
# cc( INT ) ==> INT
# .............................................................................
# Attribute accessor for cc, calculated value of nth Fibonacci term
# -----------------------------------------------------------------------------
# Params: undef: for GETTER
#       | INT:   for SETTER
# _____________________________________________________________________________
# ==> INT:  solution to the code challenge
# =============================================================================

sub cc {
    my $self = shift;
    if (@_) { $self->{cc} = shift }
    $self->{cc};
    
} # END cc()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# eq( INT ) ==> 0 | 1
# .............................................................................
# Equality instance method
# -----------------------------------------------------------------------------
# Params: INT represents an expected value (not a Fibonacci object)
# _____________________________________________________________________________
# ==> 0 | 1
# =============================================================================

sub eq {
    my $self  = shift;
    my $other = shift;
    $self->cc() == $other;

} # END eq()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# inspect( [-v] ) ==> describe or (if -v) pretty-print
# .............................................................................
# Inspect instance method for inspecting the internals of Fibonacci object
# -----------------------------------------------------------------------------
# Params: undef ==> return sentence description
#       | -v    ==> increase verbosity by pretty-printing object internals
# _____________________________________________________________________________
# ==> Fibonacci innards described and/or pretty-printed
# =============================================================================

sub inspect {
    my $self = shift;
    my $verbosity = shift;
    if ($verbosity) {
	unless ($verbosity eq "-v") {
	    print STDERR $USAGE;
	    print STDERR
		qq{ERROR: the only option allowed is '-v' (not $verbosity)\n};
	    exit -1;
	}
    }
    my ($n, $cc) =
	($self->params(), $self->cc());

    print qq{Fibonacci $n == $cc.\n};
    print "@cache";
    print "\n\n";

    if ($verbosity) {
	Data::Printer::p($self);
    }
    
} # END inspect()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# main( [-v] INT ) ==> INT
# .............................................................................
# Main function to run Fibonacci from the command-line
# -----------------------------------------------------------------------------
# Options:[-v] option  for increasing verbosity of  result, pretty-printing the
#              returned Fibonacci object;
# Params: INT: represents  the term of the Fibonacci sequence  to calculate; is
#              0-based; must be >= 0;
# _____________________________________________________________________________
# ==>     INT: represents the calculated Fibonacci value for the requested term
# =============================================================================

sub main {

    my $verbosity;
    $verbosity = shift                if $_[0] eq '-v';
    print STDERR $USAGE && exit -1    unless @_ == 1;

    my $n = shift;                  # seeking nth term of Fibonacci sequence
    unless ($n =~ /^[[:digit:]]+$/ && $n >= 0) {
	print STDERR $USAGE;
	print STDERR
	    "ERROR: n must be greater than or equal to zero (not $n).\n\n";
	exit -1;
    }

    my $fib = Fibonacci->fibonacci({ n=> $n });
    $fib->inspect($verbosity);

} # END main()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# perl5 fibonacci [ -v ] INT
# ./fibonacci [ -v ] INT
# .............................................................................
# Command-line invocation; runs the main() function with command-line args
# -----------------------------------------------------------------------------
# Options: -v  -- pretty-print object
# Params : INT -- sought-after term of the Fibonacci sequence
# _____________________________________________________________________________
# ==> INT -- represents the nth term of the Fibonacci sequence
# =============================================================================

main(@ARGV) if not caller();

# END command-line
# /////////////////////////////////////////////////////////////////////////////


print "";
__END__
