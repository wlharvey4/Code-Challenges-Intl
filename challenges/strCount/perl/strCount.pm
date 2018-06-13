# challenges/strCount/perl/strCount.pm
# ====================================================
# CREATED: 2018-06-13
# VERSION: 1.0.0
# AUTHOR: wlharvey4
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
# ----------------------------------------------------

use strict;
use warnings;

sub strCount {
    # @_ := {'str1' => string1, 'str2' => string2}
    my $str1 = $_[0]->{'str1'};
    my $str2 = $_[0]->{'str2'};
    my @c = $str1 =~ /$str2/g;
    return scalar @c;
}

1;
