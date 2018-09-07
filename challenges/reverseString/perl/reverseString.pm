# challenges/reverseString/perl/reverseString.pm
# ====================================================
# CREATED: 2018-07-04
# UPDATED: 2018-09-07
# VERSION v1.1.0
# AUTHOR: wlharvey4
# USAGE: perl5 reverseString.pm <str>
# ABOUT: Given a string, return a new string with the
#        characters in reverse order.
# NOTES: `&reverse' works in both LIST and SCALAR contexts;
#        in LIST context, it reverses the elements of the array argument;
#        in SCALAR context, it concatenates the elements of the array,
#        and then returns a STRING with the characters reversed.
# CHANGE-LOG:
#        2018-07-04 v1.0.0: initial commit
#	 2018-09-07 v1.1.0:
#	 --added package ReverseString
#	 --converted to a modulino, callable as either a module or script
# ----------------------------------------------------

package ReverseString;

use strict;
use warnings;
use v5.16;

# params := {str => "..."}
# ==> <str>
sub reverseString {
    my $params = shift;
    my $str = $params->{str};
    return scalar reverse $str;
}

# @_ := @ARGV (as below)
sub main {
    my $str = shift;
    my $rs = reverseString({ str => $str });
    say "The reverse of $str is $rs";
}

# @ARGV := <str> where <str> is some random String value
main(@ARGV) unless caller();

1;
