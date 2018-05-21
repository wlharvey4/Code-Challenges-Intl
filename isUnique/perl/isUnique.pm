# perl/isUnique.pm
# ====================================================
# CREATED: 2018-05-21
# UPDATED 2018-05-21
# VERSION: 2.0.0
# AUTHOR: wlharvey4
# ABOUT: Implement an algorithm to determine if a
#        string has all unique characters.
# NOTES: Extra Credit - Answer this question - What if
#        you cannot use additional data structures?
# ----------------------------------------------------

use strict;
use warnings;
use v5.16;
use boolean ':all'; # use Perl boolean values

use Data::Printer;

# params := {str => <String>}
sub isUnique {
    my $params = shift;
    my $str = $params->{str};
    # split $str and map into a hash, losing repeated chars
    my %strSplit = map{$_ => 1} split('', $str);
    # count the  number of keys
    my $c = scalar keys %strSplit;

    my $b = boolean((length($str) == $c));
    return $b;
}

1;
