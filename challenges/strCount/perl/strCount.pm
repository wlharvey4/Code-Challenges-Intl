#!/usr/bin/env perl5

# Code-Challenges-Intl/challenges/strCount/perl/strCount.pm
# =============================================================================
# CREATED: 2018-06-13
# UPDATED: 2018-10-25
# VERSION: 3.0.0
# AUTHOR : wlharvey4
# USAGE  : perl5 strCount.pm <str1> <str2>
# ABOUT  : strCount challenge implemented in Perl
# NOTES  : The  RE expresion  /$re/g returns an  array of matches;  returning
#        : the  scalar value  of  an  array returns the array's size.
#	 : Converted to OO Perl
# CHANGE_LOG:
# .............................................................................
# version 1.1.0 2018-09-07
# -- A dded package StrCount
# -- converted into modulino, callable as either a module or script
# .............................................................................
# version 2.0.0 2018-10-23T19:00
# -- Added README.md; removed description of challenge from About
# -- Completely refactored module using object-oriented paradigm in order to
#    to compare with Ruby; much, much harder to do, with no benefit to
#    readability and probably not worth the effort for this little code; but,
#    nevertheless it was a good exercise in coding Perl using Objects.
# .............................................................................
# version 2.1.0 2018-10-24T00:00
# -- Refactored check.pm to interface with this OO-style code; found good
#    and useful benefits to coding using OO style when running this code as a
#    module, especially that it is directly reachable without the necessity of
#    typeglob aliasing, etc, and the code is more readable from that end, even
#    though this code might look more complicated.  There are also hugh
#    advantages for comparisons, equality checking, debugging, and observing
#    the object's internals easily and in color.
# -- added 'cmp' and 'eq' methods; changed return instance variable to 'output'
#    to make generic amongst other code challenges as well.
# .............................................................................
# version 3.0.0 2018-10-25T06:55
# -- Refactored instance methods to verify constraints; refactored constructor
#    to go through accessors to set instance variables and check constraints;
# -- refactored calculate to be a pure function, not a method
# -- refactored all comments
# -----------------------------------------------------------------------------

use strict;
use warnings;
use v5.16;

use Data::Printer output => 'stdout';




package StrCount;

my $USAGE = qq{USAGE: strCount str1 str2
where str1 is random length string (may be empty) and str2 is single character.\n};

# =============================================================================
# StrCount->strCount {str => <string>, char => <string>}
# .............................................................................
# StrCount constructor
# -----------------------------------------------------------------------------
# Params: Hash of
#	  str  -- variable length string; may be empth
#	  char -- single character; may not be empty
# _____________________________________________________________________________
# ==>     str:   String
#	  char:  String
# 	  count: Integer
# =============================================================================

sub strCount {
    my $class = shift;
    my ($params) = @_;
    my ($str, $char) = ($params->{str1}, $params->{str2});

    my $self = bless {}, $class;
    $self->cc(calculate($self->str($str), $self->char($char)));

    $self;

} # END strCount()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# calculate(str, char) => int
# .............................................................................
# Function to calculate occurrences of a character in a string
# -----------------------------------------------------------------------------
# Params: str -- represents the target string; may be empty
#         char -- represents the target character to search for within the
#                   target string; cannot be empty
# _____________________________________________________________________________
# ==>     int -- represents the count of occurrences of the character in
#                    the string
# =============================================================================

sub calculate {
    my $str = shift;
    my $char = shift;

    my @c = $str =~ /$char/g;
    scalar @c;

} # END calculate()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# str() | str(Str) ==> str
# .............................................................................
# Attribute accessor to 'str' instance var
# -----------------------------------------------------------------------------
# Params: undef | String
# _____________________________________________________________________________
# ==>     String -- represents the target string; may be empty
# =============================================================================

sub str {
    my $self = shift;
    if (@_) { $self->{str} = shift }
    unless ($self->{str}) { $self->{str} = '' } # if undef, set to empty str
    $self->{str};

} # END str()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# char() | char(Str) ==> Str
# .............................................................................
# Attribute accessor to 'char' instance var
# -----------------------------------------------------------------------------
# Params: undef | Str
# _____________________________________________________________________________
# ==>     Str -- represents the single character string to search within
#                str; must contain a single character
# =============================================================================

sub char {
    my $self = shift;
    if (@_) { $self->{char} = shift }
    unless (length $self->{char} == 1) {
	die "ERROR: 'char' must contain one and only one character";
    }
    $self->{char};

} # END char()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# cc() | cc(int) ==> Int
# .............................................................................
# Attribute accessor to 'cc' instance var
# -----------------------------------------------------------------------------
# Params: undef | Int
# _____________________________________________________________________________
# ==>     Int -- represents the solution to the coding challenge
# =============================================================================

sub cc {
    my $self = shift;
    if (@_) { $self->{cc} = shift }
    unless ($self->{cc} =~ /^[[:digit:]]+$/) {
    	die "ERROR: 'cc' must be an Integer";
    }
    $self->{cc};

} # END cc()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# cmp(StrCount)
# .............................................................................
# Comparision method
# -----------------------------------------------------------------------------
# Params: StrCount object to compare against the receiver
# _____________________________________________________________________________
# ==>     -1 | 0 | +1
# =============================================================================

sub cmp {
    my $self = shift;
    my $expected = shift;
    if ($self->cc() == $expected)   {  0 }
    elsif ($self->cc() < $expected) { -1 }
    else                            { +1 }

} # END cmp()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# eq(StrCount)
# .............................................................................
# Equality method
# -----------------------------------------------------------------------------
# Params: StrCount object to query for equality
# _____________________________________________________________________________
# ==> 0 | 1
# =============================================================================

sub eq {
    my $self = shift;
    my $expected = shift;
    $self->cmp($expected) == 0;

} # END eq()
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# inspect() | inspect(-v)
# .............................................................................
# Object inspect method
# -----------------------------------------------------------------------------
# Params: undef -- return simple string description
#       : -v    -- increase verbosity by pretty-printing innards
# _____________________________________________________________________________
# ==> Object innards
# =============================================================================

sub inspect {
    my $self = shift;
    my ($str, $char, $count) = ($self->str(), $self->char(), $self->cc());
    print "strCount of '$char' in '$str' is $count.\n";

    if (@_ && $_[0] eq '-v') {
	Data::Printer::p($self);
    }

} # END inspect
# /////////////////////////////////////////////////////////////////////////////


# =============================================================================
# main [-v] Str1 Str2
# .............................................................................
# Main Function for command-line usage; ignored when this module is loaded by
# another script
# -----------------------------------------------------------------------------
# Option :  -v -- increase verbosity by pretty-printing object
# Params: Str1 -- target string
#         Str2 -- char string
# _____________________________________________________________________________
# ==>     Int -- count of occurrences of char in str
# =============================================================================

sub main {
    my $verbosity = '';
    if (@_ && $_[0] eq '-v') {
	$verbosity = shift;
    }

    my ($str1, $str2) = eval { @_ if @_ == 2 };
    unless ($str1 && $str2) { print $USAGE; exit 1; }

    my $sc = StrCount->strCount({ str1 => $str1, str2 => $str2 });
    $sc->inspect($verbosity);

} # END main()
# /////////////////////////////////////////////////////////////////////////////

# Invoke main() when run from the command-line
# =============================================================================
main(@ARGV) unless caller();

1;
__END__
