# mult3and5/perl/mult3and5.pm
# ============================================================================
# CREATED: 2018-09-04
# UPDATED: 2018-09-07
# VERSION: 1.1.0
# AUTHOR:  wlharvey4
# USAGE: perl5 mult3and5.pm <n>
# ABOUT: If we list all the natural numbers below 10 that are
# multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these
# multiples is 23.  Find the sum of all the multiples of 3 or 5 below
# 1000.
# NOTES: Since I have already done FIZZBUZZ, use it instead of reimplementing
# it.  Perl has a few functions that might be usable: `do', `require', `use'
# However, `use' requires that the module being called has exported some
# function using the `import' function (`use' calls the `import' method for
# the package being used).  Since this was not set up, consider using either
# `do' or `require' instead.  `do' reads the contents of a file and executes
# it as a Perl script; it is not really designed to deal with modules.
# That leaves `require', which loads code from a module and does some fancy
# error checking.  `require' can either read in a string filename, or a
# package-style filename (a bareword with directories separated by `::'.  In
# the latter case, the special command `use lib' must place the root into
# @INC.  However, it's a bit tricky because the current working directory
# depends on which program is initially called.  Since this is a module in
# the Code-Challenges-Intl package, we can assume it will be called from
# the languages directory, i.e., languages/perl.  There is probably an
# environment variable that indicates the current working directory.  That
# is a TODO to find it and use it here.
# CHANGE HISTORY:
#   v1.0.0 2018-09-04: Initial creation
#   v1.1.0 2018-09-05: Started using packages, so added Fizzbuzz to fizzbuzz()
#                      also started creating packages as modulinos, callable
#	               as both a module and a script
# ----------------------------------------------------------------------------

package Mult3and5;

use strict;
use warnings;
use v5.16;
use lib '../../../challenges';
require fizzbuzz::perl::fizzbuzz;

# params => {n => <n>} where <n> is some positive integer
# ==> <total> where <total> is some positive integer
sub mult3and5 {
    my $params = shift;
    my $n = $params->{n};
    my $total = 0;

    for (my $i = 0; $i < $n; $i++) {
	my $r = Fizzbuzz::fizzbuzz({n => $i});
	if ( $r =~ /fizz|buzz/ ) {
	    $total += $i;
	}
    }

    return $total;
}

# @_ := @ARGV (as below)
sub main {
    my $n = shift;
    my $m35 = mult3and5({ n => $n });
    say "The sum of multiples of 3 and 5 is $m35";
}

# @ARGV := <n> where <n> is some positive integer
main(@ARGV) unless caller();

1;
