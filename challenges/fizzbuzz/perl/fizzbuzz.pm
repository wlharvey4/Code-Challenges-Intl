# fizzbuzz/perl/fizzbuzz.pm
# ====================================================
# CREATED: 2018-05-20
# UPDATED: 2018-09-07
# VERSION: 2.1.0
# AUTHOR: wlharvey4
# USAGE: perl5 fizzbuzz.pm <n>
# ABOUT: fizzbuzz in Perl
# NOTES:
# CHANGE_LOG:
#	2018-09-07 ver 2.1.0:
#       --added package identifier;
#	--converted into a modulino, callable as either
#	  a module or a script
# ----------------------------------------------------

package Fizzbuzz;

use strict;
use warnings;
use v5.16;

my $FIZZ = "fizz";
my $BUZZ = "buzz";
my $FIZZBUZZ = "${FIZZ}${BUZZ}";

our $fizzbuzz = "This is Fizzbuzz";

# params := ( {n => <n>} ) where <n> is some positive integer
# ==> fizz|buzz|fizzbuzz|<n>
sub fizzbuzz {
    my $params = shift;
    my $n = $params->{n};
    my $fizz = !($n % 3);
    my $buzz = !($n % 5);

    return (
	($fizz && $buzz) ? $FIZZBUZZ :
	($fizz || $buzz) ? $fizz ? $FIZZ : $BUZZ :
	$n
    );
}

# @_ := @ARGV (as below)
sub main {
    my $n = shift;
    say "\$n => $n";
    my $fb = fizzbuzz({ n => $n });
    say "Fizzbuzz of $n is $fb";
}

# @ARGV := ( <n> ) where <n> represents some positive integer
main(@ARGV) unless caller();

1;
