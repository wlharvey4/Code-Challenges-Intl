#! /usr/bin/env perl5

# fibonacci.pm
###################################################
# CREATED: 2018-09-07
# UPDATED: 2018-09-08
# VERSION: 1.1.0
# AUTHOR: wlharvey4
# USAGE: perl5 fibonacci.pm <n>
# CHALLENGE: Fibonacci sequence in Perl
# NOTES:
#  -- start using package identifiers
#  -- Start making these packages callable either as a
#     module (from another package) or a script (from
#     the command line), which has been named a `Modulino'
#     by brian d foy;
#  -- NOTE that beginning with Perl 5.28, it is possible to
#     initialize a state variable in list context, so
#     when I switch to using that version, update this
#     code to use a state @cache;
#  -- Found the `bigint' package, which allows
#     arbitrarily large numbers to be created (limited
#     by memory only)
#  -- discovered that the message re: `deep recursion'
#     is coming from the `warnings' pragma, so it can
#     be quieted without issue in this case; when the
#     `bigint' pragma is activated, it sees the final `1'
#     as a number to be processed, and then the `warnings'
#     pragma issues a `void context' message; this can be
#     avoided by changing the final `1' to a print ""
#     statement instead.
# CHANGE_LOG:
#   -- 1.0.0 2018-09-07: Initial commit
#   -- 1.1.0 2018-09-08: Added `bigint' package; quieted
#            the `deep recursion' and 'void' warnings;
#	     clean up code a bit
###################################################

package Fibonacci;

use strict;
use warnings;
no warnings qw(recursion);
use v5.16;
use bigint;

my @cache = (1, 1);

# params := ( {n => <n>} ) where <n> is some positive integer representing
#	    the nth fibonacci sequence
# ==> <fib_value> where <fib_value> is the fibonacci term (an integer)
#     for the nth fibonacci sequence
sub fibonacci {
    my $n = $_[0]->{n};
    
    return $cache[$n] if scalar @cache > $n;
    return $cache[$n] = fibonacci({ n => $n - 2 }) + fibonacci({ n => $n - 1 });
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

print "";
