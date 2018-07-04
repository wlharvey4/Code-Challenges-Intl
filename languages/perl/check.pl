#! /usr/bin/env perl

# perl/check.pl
# ====================================================
# CREATED: 2018-05-19
# UPDATED: 2018-07-04
# VERSION 1.1.0
# AUTHOR: wlharvey4
# ABOUT: Test script for perl Perl code challenges
# USAGE: ./check <code-challenge>
# NOTES:
# CHANGE-LOG:
#   v1.1.0: added `eval' (i.e., `try') around check
#           for $e->isa Boolean because a null $e
#           throws an error.
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

# get the Code Challenge name from the command-line argument
$cc = $ARGV[0];
unless ($cc) {
    die qq{You need to include the name of a code challenge: i.e., './check <code-challenge>'}
}

# construct paths to resources
$ccPM = catfile('..', '..', $CHALLENGES, ${cc}, 'perl', ${cc}.'.pm');
$ccJSON = catfile('..', '..', $CHALLENGES, ${cc}, ${cc}.'.json');

require $ccPM; # load the code challenge module
*fn = *{$cc};  # alias the code challenge name (&{$cc}) to &fn
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
