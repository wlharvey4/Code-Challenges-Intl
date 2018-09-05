# mult3and5/perl/mult3and5.pm
# ============================================================================
# CREATED: 2018-09-04
# VERSION: 1.0.0
# AUTHOR:  wlharvey4
# ABOUT:   From ...
# DIRECTIVE: If we list all the natural numbers below 10 that are
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
# ----------------------------------------------------------------------------

use strict;
use warnings;
use v5.16;
use lib '../../challenges';
require fizzbuzz::perl::fizzbuzz;

sub mult3and5 {
    my $p = shift;
    my $n = $p->{n};
    my $total = 0;

    for (my $i = 0; $i < $n; $i++) {
	my $r = fizzbuzz({n => $i});
	if ( $r =~ /fizz|buzz/ ) {
	    $total += $i;
	}
    }

    return $total;
}

1;
