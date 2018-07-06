# challenges/palindrone/perl/palindrome.pm
# ====================================================
# CREATED: 2018-07-06
# UPDATED: 2018-07-06
# VERSION: v1.0.0
# AUTHOR: wlharvey4
# ABOUT: Given a string, return true if the string is a palindrome
#        or false if it is not.
# NOTES:

# --INTEGER MATH: By default, Perl assumes that it must do most of its
# arithmetic in floating point. But by saying `use integer;' you may
# tell the compiler to use integer operations (see integer for a
# detailed explanation) from here to the end of the enclosing
# BLOCK. An inner BLOCK may countermand this by saying `no integer;'.

# --REVERSE: In scalar context, concatenates the elements of LIST and
# returns a string value with all characters in the opposite order.

# CHANGE-LOG:
# ----------------------------------------------------

use strict;
use warnings;
use v5.16;
use boolean;
use integer;

# @_ := {str => "..."}
sub palindrome {
    my $str = $_[0]->{str};

    my $len = length($str);
    my $half = $len / 2; # use integer Math here
    my $left = substr $str, 0, $half;
    my $right = reverse scalar substr $str, $len - $half;

    return boolean($left eq $right);
}

1;
