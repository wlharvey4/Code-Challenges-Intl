#! /usr/bin/env perl5

# fibonacci.pm
###################################################
# CREATED: 2018-09-07
# MODIFIED:
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# USAGE: perl5 fibonacci.pm <n>
# CHALLENGE: Fibonacci sequence in Perl
# NOTES:
#  -- Start making these scripts callable is a
# module or as a script (called a `Modulino' by
# brian d foy;
#  -- also start using package identifiers
# CHANGE_LOG:
#	2018-09-07 ver 1.0.0: Initial commit
###################################################

package Fibonacci;

use strict;
use warnings;
use v5.16;

my @cache = (1, 1);

# params := ( {n => <n>} ) where <n> is some positive integer representing
#	    the nth fibonacci sequence
# ==> <fib_value> where <fib_value> is the fibonacci term (an integer)
#     for the nth fibonacci sequence
sub fibonacci {
    my $p = shift;
    my $n = $p->{n};

    return $cache[$n] if scalar @cache > $n;
    my $fib = fibonacci({ n => $n - 2 }) + fibonacci({ n => $n - 1 });
    push @cache, $fib;
    return $fib;
}

# @_ := @ARGV (as below)
sub main {
    my $n = shift;
    my $fib = fibonacci({ n => $n });
    say "Fibonacci $n => $fib";
}

# @ARGV := <n> where <n> is some positive integer representing the
# nth fibonacci sequence
main(@ARGV) if not caller();

1;

