# fizzbuzz/perl/fizzbuzz.pm
# ====================================================
# CREATED: 2018-05-20
# VERSION: 2.0.0
# AUTHOR: wlharvey4
# ABOUT: fizzbuzz in Perl
# NOTES:
# ----------------------------------------------------

use strict;
use warnings;
use v5.16;

my $FIZZ = "fizz";
my $BUZZ = "buzz";
my $FIZZBUZZ = "${FIZZ}${BUZZ}";

# $p := {n => #} where # is some integer
sub fizzbuzz {
    my $p = shift;
    my $n = $p->{n};
    my $fizz = !($n % 3);
    my $buzz = !($n % 5);

    return (
	($fizz && $buzz) ? $FIZZBUZZ :
	($fizz || $buzz) ? $fizz ? $FIZZ : $BUZZ :
	$n
    );
}

1;
