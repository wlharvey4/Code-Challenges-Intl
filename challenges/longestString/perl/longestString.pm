#! /usr/bin/env perl

# Code-Challenges-Intl/challenges/longestString/perl/longestString.pm
# ==============================================================================
# PROJECT : Code-Challenge-Intl
# LANGUAGE: Perl
# FILENAME: longestString.pm
# CREATED : 2018-11-29
# UPDATED : 2018-11-30
# VERSION : 1.0.0
# ------------------------------------------------------------------------------
# CHALLENGE: Given an array of strings, return the longest.
# NOTES:
# 1. A whole bunch of problems ensued from allowing an empty array; an empty
#    array is equivalent to an undef'ed value, which is falsey, etc.  So, a
#    whole lot of checking needs to be done that would be unnecessary if empty
#    arrays were simply not allowed.  Be that as it may, empty arrays should be
#    allowed and should return 'undef'.
# 2. Allowing an empty array causes problems in 'check' when it attempts to
#    determine whether a result 'isa' BigInt; the best solution is to wrap this
#    check in an 'eval', just like the check for 'isa' Boolean, rather than
#    override the default 'isa' method here.  Doing so solves one problem, but
#    raises another, e.g., the eg() method now throws uninitialized value
#    warnings.  The solution is to check for an uninitialzed value immediately,
#    and return true if so.
# ------------------------------------------------------------------------------
# CHANGE-LOG:
# ..............................................................................
# -- 2018-11-29T19:45 ver.0.0.1
#    Initial coding; works from the command-line, but not via check
# ..............................................................................
# -- 2018-11-30T21:15 ver.0.1.0
#    Refactored cc() and params() to be accessors instead of getters; refactored
#    longestString() to use accessors; still works from the command-line;
#    checked for undef values in multiple methods and responded appropriately.
# ..............................................................................
# -- 2018-11-30T23:55 ver.1.0.0
#    Added better documentation
# ==============================================================================

use strict;
use warnings;
use v5.16;

use Data::Printer output => 'stdout';

# LongestString Class
# ..............................................................................
# Given an array of strings, return the longest string.
# -------------------------------------------------------------------------------
# Private Instance Variables:
# +++++++++++++++++++++++++++
# arr     : [STRING] -- the array of strings; may be empty
# longest : STRING   -- the longest string; may return 'undef' for empty params
# ------------------------------------------------------------------------------
# Public Instance Methods:
# ++++++++++++++++++++++++
# params() ==> [STRING] -- attribate accessor; optional param: [STRING]
# cc()     ==> STRING   -- attribute accessor; optional param: STRING
# eq()     ==> BOOLEAN  -- getter; required param: STRING
# inspect()==> MESSAGE  -- pretty-printer; optional -v | -V
# usage()  ==> MESSAGE  -- usage message
# ------------------------------------------------------------------------------
# Functions:
# ++++++++++
# main()      -- Command-line entry point
# calculate() -- given an array of strings, find the longest
# ==============================================================================

package LongestString {

    # LongestString->longestString({ arr => [arr-ref-of-strings] }) ==> OBJECT
    # ..........................................................................
    # LongestString constructor
    # --------------------------------------------------------------------------
    # @_ := hash ref {arr} containing array ref of strings
    # ==> LongestString object containing the longest string
    # ==========================================================================
    sub longestString {
        my $class  = shift;
        my $params = shift;
        my @arr = @{$params->{arr}};
        my $self = bless {}, $class;

        $self->params( @arr );
        $self->cc( calculate( @arr ));

        return $self;

    } # END longestString() ////////////////////////////////////////////////////


    # &calculate(@array) ==> string
    # ..........................................................................
    # Function to calculate the longest string of an array of strings
    # --------------------------------------------------------------------------
    # @_ := array of strings; may be empty
    # ==> string representing the longest of the strings
    # ==========================================================================
    sub calculate {
        my @a = @_;

        return undef unless @a;

        my $l = shift @a;
        for my $e ( @a ) {
            $l = length($e) > length($l) ? $e : $l;
        }
        return $l;
    } # END calculate() ////////////////////////////////////////////////////////


    # self->cc() ==> string
    # self->cc(cc) ==> string
    # ..........................................................................
    # Attribute accessor for longest string
    # --------------------------------------------------------------------------
    # @_ := ()		getter of 'longest' instance variable
    #    := (string)	setter of 'longest' instance variable
    # ==> string
    # ==========================================================================
    sub cc {
        my $self = shift;
        $self->{longest} = shift if @_;
        return $self->{longest};
    } # END cc() ///////////////////////////////////////////////////////////////


    # self->arr() ==> array of strings
    # self->arr(params) ==> array of strings
    # ..........................................................................
    # Attribute accessor for input array
    # --------------------------------------------------------------------------
    # @_ := ()			getter of 'arr' instance variable
    #    := (string-arr)	setter of 'arr' instance variable
    # ==> array of strings representing input array
    # ==========================================================================
    sub params {
        my $self = shift;
        $self->{arr} = [@_] if @_;
        return exists $self->{arr} ? @{$self->{arr}} : ();
    } # END arr() //////////////////////////////////////////////////////////////


    # self->eq(string) ==> 0 | 1
    # ..........................................................................
    # Method to compare the object's longest against a string for equality
    # --------------------------------------------------------------------------
    # @_ := string to compare against
    # ==> 0 | 1
    # ==========================================================================
    sub eq {
        my $self  = shift;
        return 1 unless $self;
        my $str = shift;
        return $self->cc() eq $str;
    } # END eq() ///////////////////////////////////////////////////////////////


    # self->inspect(verbosity) ==> message
    # ..........................................................................
    # Method to inspect the internals
    # --------------------------------------------------------------------------
    # @_ =: () | -v | -V
    #            -v := increase verbosity (include input array)
    #            -V := really increase verbosity (pretty-print $self)
    # ==> message
    # ==========================================================================
    sub inspect {
        my $self = shift;
        my $value = $self->cc() // 'undef';
        my $verbosity = shift // 0;

        say STDOUT "The longest string is '$value'";

        if ($verbosity eq '-v') {
            my @arr = $self->arr();
            say "Of...";
            Data::Printer::p @arr;
        } elsif ( $verbosity eq '-V') {
            Data::Printer::p $self;
        }
    } # END inspect() //////////////////////////////////////////////////////////


    # $class->usage() --> message
    # ..........................................................................
    # Method to display usage information
    # --------------------------------------------------------------------------
    # @_ := ()
    # ==> usage information
    # ==========================================================================
    sub usage {
        print STDERR "USAGE: longestString str_1 str_2 ... str_n [-v | -V] [-h | --help]\n";
    } # END usage()

} # END LongestString //////////////////////////////////////////////////////////


# main(@ARGV) --> message
# ..............................................................................
# If called directly from the command line, process using the CL args
# ------------------------------------------------------------------------------
# @_ := @ARGV | -h | --help
# ==> message
# ==============================================================================
sub main {
    if ( !@ARGV || $ARGV[0] =~ /-h|--help/i ) { LongestString->usage(); return; }

    my $verbosity = '';
    if ( @ARGV && $ARGV[-1] =~ /-v/i ) { $verbosity = pop @ARGV }

    my $answer = LongestString->longestString( {arr => [@ARGV]} );
    $answer->inspect( $verbosity );

} # END main() /////////////////////////////////////////////////////////////////


&main() unless caller();

1;

__END__
