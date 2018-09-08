#! /usr/bin/env perl5

# perl/check.pl
# ====================================================
# CREATED: 2018-05-19
# UPDATED: 2018-09-08
# VERSION 2.1.0
# AUTHOR: wlharvey4
# ABOUT: Test script for perl Perl code challenges
# USAGE: ./check <code-challenge>
# NOTES:
# CHANGE-LOG:
#   v1.1.0 2018-07-04: added `eval' (i.e., `try')
#          around check for $e->isa Boolean because
#          a null $e throws an error.
#   v1.1.1 2018-09-04: changed the interpreter from
#          perl to perl5
#   v2.0.0 2018-09-07: Added package names to each
#	   perl module; updated routine to alias the
#	   package name along with the code challenge
#	   name
#   v2.1.0 2018-09-08: Added `bigint' pragma to
#          `fibonacci' code challenge, which broke the
#	   `eq_deeply' check because the return value
#	   is a Math::BigInt object; so now, check to
#	   see if the return value is a Math::BigInt
#	   object, and if so, then convert the `expected'
#	   value to a Math::BigInt object also
# ----------------------------------------------------

# pragmas
use strict;
no  strict "refs"; # allows aliasing using variables
use warnings;
use v5.16;
use lib '..';	# gives access to code challenges as modules
use boolean;	# gives access to Perl boolean values

# Utility libraries
use File::Spec::Functions; # provides &catfile() for portable path creation
use Data::Printer output => 'stdout'; # provides &p() (pretty-printing of data structures)
use JSON;		# provides &decode_json()
use Test::Deep::NoTest; # provides &eq_deeply()

# CONSTANTS
my $CHALLENGES = "challenges";

# Variables
our $fn;	# the aliased code challenge subroutine
my $cc;		# the name of the code challenge from the CL invocation
my $ccPM;	# the code challenge module path
my $ccJSON;	# the code challenge data path
my $jsonData;	# the code challenge data storage
my $packg;	# the uppercased name of $cc (a package name)

# get the Code Challenge name from the command-line argument
$cc = $ARGV[0];
unless ($cc) {
    die qq{You need to include the name of a code challenge: i.e., './check <code-challenge>'}
}
$packg = ucfirst $cc;

# construct paths to resources
$ccPM = catfile('..', '..', $CHALLENGES, ${cc}, 'perl', ${cc}.'.pm');
$ccJSON = catfile('..', '..', $CHALLENGES, ${cc}, ${cc}.'.json');

require $ccPM; # load the code challenge module
# alias the Code Challenge's symbol table `<packg>::<cc>' to the `main::fn' symbol table, allowing
# `&main::fn' access to `<&packg>::<cc>'
*fn = *{$packg."::".$cc};

$jsonData = eval { # load and decode the test data into a Perl hash reference
    local $/;
    open JSON, '<', $ccJSON;
    decode_json(<JSON>);
} || die $@;

# the test runner; uses eq_deeply
our ($i, $w) = (0, 0); # $i :=  test number; $w := number of tests found wrong
for my $test (@$jsonData) {
    $i++;
    my $p = $test->{params};
    my $e = $test->{expected};
    if (eval { $e->isa("JSON::PP::Boolean") }) {  # need to convert JSON boolean to Perl boolean
	$e = boolean($e)			  # a null $e will throw an error, so simply ignore
    }
    my $r = fn($p);
    # if a code challenge uses the `bigint' pragma (e.g., `fibonacci'), need to convert the
    # `expected' value to a Math::BigInt object in order to compare; don't want to simply load
    # the `bigint' pragma because then all math operations will be converted into Math::BigInt ones
    if ($r->isa("Math::BigInt")) { $e = Math::BigInt->new($e); }
    assertError($p, $r, $e)  unless eq_deeply($r, $e);
}

my $total = scalar @$jsonData;
printf(qq{====================================================
Attempted:\t%d
Ok:\t\t%d
Failed:\t\t%d
====================================================
}, $total, $total-$w, $w);

sub assertError {
    my ($p, $r, $e) = @_;
    say("----------------------------------------------------");
    say("Test [$i]");
    print("Params:   => ");
    p($p);
    print("Expected: => ");
    p($e);
    print("Received: => ");
    p($r);
    print("----------------------------------------------------\n");
    $w++;
}
