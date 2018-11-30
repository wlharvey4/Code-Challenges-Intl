# ==============================================================================
# PROJECT : Code-Challenge-Intl
# LANGUAGE: Perl
# FILENAME: longestString.pm
# CREATED : 2018-11-29
# UPDATED : 2018-11-29
# VERSION : 0.0.1
# ------------------------------------------------------------------------------
# CHALLENGE: Given an array of strings, return the longest.
# NOTES:
# ------------------------------------------------------------------------------
# CHANGE-LOG:
# -- 2018-11-29T19:45 ver.0.0.1
#    Initial coding; works from the command-line, but not via check
# ==============================================================================

use strict;
use warnings;
use v5.16;
use Data::Printer output => 'stderr';

package LongestString {

    # LongestString->longestString({arr => [array-of-strings]}) ==> string
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

        my $longest = calculate(@arr);
        return bless {arr => [@arr], longest => $longest}, $class;

    } # END longestString()


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
    } # END calculate()


    # self->cc() ==> string
    # ..........................................................................
    # Attribute getter for longest string
    # --------------------------------------------------------------------------
    # @_ := ()
    # ==> string
    # ==========================================================================
    sub cc {
        my $self = shift;
        return $self->{longest};
    } # END cc()


    # self->arr() ==> array of strings
    # ..........................................................................
    # Attribute getter for input array
    # --------------------------------------------------------------------------
    # @_ := ()
    # ==> array of strings representing input
    # ==========================================================================
    sub arr {
        my $self = shift;
        return @{$self->{arr}};
    } # END arr()


    # self->eq(other) ==> 0 | 1
    # ..........................................................................
    # Method to compare two objects for equality
    # --------------------------------------------------------------------------
    # @_ := LongestString instance
    # ==> 0 | 1
    # ==========================================================================
    sub eq {
        my $self  = shift;
        my $other = shift;
        return $self->cc() eq $other->cc();
    } # END eq()


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
    } # END inspect()


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

} # END LongestString


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

} # END main()


&main() unless caller();

1;

__END__
