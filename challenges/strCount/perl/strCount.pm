# challenges/strCount/perl/strCount.pm
# ====================================================
# CREATED: 2018-06-13
# UPDATED: 2018-09-07
# VERSION: 1.1.0
# AUTHOR: wlharvey4
# USAGE: perl5 strCount.pm <str1> <str2>
# ABOUT:  Create a  function  called `strCount()'  that
# accepts 2 string arguments  and returns an integer of
# the count of occurrences the 2nd argument is found in
# the first  one.  If  no occurrences  can be  found, a
# count of  0 should  be returned.  The  first argument
# can be  an empty  string; The second  string argument
# will always be of length 1.
# NOTES: The  RE expresion  /$re/g returns an  array of
# matches;  returning  the  scalar value  of  an  array
# returns the array's size.
# CHANGE_LOG:
#	2018-09-07 ver 1.1.0:
#	--Added package StrCount
#	--converted into modulino, callable as either a
#	  module or script
# ----------------------------------------------------

package StrCount;

use strict;
use warnings;
use v5.16;

# params => {str1 => <str1>, str2 => <str2>}, where <str1> is a
#	    random length String value (may be the empty String)
#           and <str2> is a single character String (may not be
#	    empty String)
# ==> <count> where <count> is an integer
sub strCount {
    # @_ := {'str1' => string1, 'str2' => string2}
    my $str1 = $_[0]->{'str1'};
    my $str2 = $_[0]->{'str2'};
    my @c = $str1 =~ /$str2/g;
    return scalar @c;
}

# @_ := @ARGV (as below)
sub main {
    my ($str1, $str2) = @ARGV;
    my $c = strCount({ str1 => $str1, str2 => $str2 });
    say "There ", $c == 1 ? "is" : "are", " $c occurrence", $c == 1 ? '' : 's', " of $str2 in $str1";
}

# @ARGV := (<str1>, <str2>)  where each value is a random String;
#          <str1> can be empty String; <str2> must be single character
main(@ARGV) unless caller();

1;
