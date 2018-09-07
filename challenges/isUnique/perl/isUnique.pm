# perl/isUnique.pm
# ====================================================
# CREATED: 2018-05-21
# UPDATED: 2018-09-07
# VERSION: 2.1.0
# AUTHOR: wlharvey4
# USAGE: perl5 isUnique.pm <str_value>
# ABOUT: Implement an algorithm to determine if a
#        string has all unique characters.
# NOTES: Extra Credit - Answer this question - What if
#        you cannot use additional data structures?
# CHANGE_LOG:
#	2018-09-07 ver 2.1.0
#	--added package identifier
#	--converted into a modulino, callable as either
#	  a module or script
# ----------------------------------------------------

package IsUnique;

use strict;
use warnings;
use v5.16;
use boolean ':all'; # use Perl boolean values

# params := {str => <str_value>} where <str_value> is some
#           random length String
# ==> 0|1 (Boolean true|false)
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

# @_ := @ARGV (as below)
sub main {
    my $str = shift;
    my $iu = isUnique({ str => $str });
    say "$str is ", $iu ? "unique" : "not unique";
}

# @ARGV := <str_value> where <str_value> is some random length String
main(@ARGV) unless caller();

1;
