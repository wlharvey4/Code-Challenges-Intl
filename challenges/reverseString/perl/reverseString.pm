# challenges/reverseString/perl/reverseString.pm
# ====================================================
# CREATED: 2018-07-04
# UPDATED: 2018-07-04
# VERSION v1.0.0
# AUTHOR: wlharvey4
# ABOUT: Given a string, return a new string with the
#        characters in reverse order.
# NOTES: `&reverse' works in both LIST and SCALAR contexts;
#        in LIST context, it reverses the elements of the array argument;
#        in SCALAR context, it concatenates the elements of the array,
#        and then returns a STRING with the characters reversed.
# CHANGE-LOG:
#        v1.0.0: initial commit
# ----------------------------------------------------

use strict;
use warnings;
use v5.16;

# @_ := [{str => "..."}]
sub reverseString {
    my $params = pop;
    my $str = $params->{str};
    return scalar reverse $str;
}

1;
