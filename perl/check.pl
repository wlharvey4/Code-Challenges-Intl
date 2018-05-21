#! /usr/bin/env perl

# perl/check.pl
# ====================================================
# CREATED: 2018-05-19
# UPDATED: 2018-05-21
# VERSION 2.2.0
# AUTHOR: wlharvey4
# ABOUT: Test script for perl implementations
# USAGE: ./check <code-challenge>
# NOTES:
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

# Variables
our $fn;	# the aliased code challenge subroutine
my $cc;		# the name of the code challenge from the CL invocation
my $ccPM;	# the code challenge module path
my $ccJSON;	# the code challenge data path
my $json;	# the code challenge data storage

# get the Code Challenge name from the command-line argument
$cc = $ARGV[0];
unless ($cc) {
    die qq{You need to include the name of a code challenge: i.e., './check <code-challenge>'}
}

# construct paths to resources
$ccPM = catfile(${cc}, 'perl', ${cc}.'.pm');
$ccJSON = catfile('..', ${cc}, ${cc}.'.json');

require $ccPM; # load the code challenge module
*fn = *{$cc};  # alias the code challenge name (&{$cc}) to &fn
$json = eval { # load and decode the test data into a Perl hash reference
    local $/;
    open JSON, '<', $ccJSON;
    decode_json(<JSON>);
} || die $@;

# deeply test the Code Challenge results against the expected values
our ($i, $w) = (0, 0); # $i :=  test number; $w := number of tests found wrong
for my $test (@$json) {
    $i++;
    my $p = $test->{params};
    my $e = $test->{expected};
    if ($e->isa("JSON::PP::Boolean")) { $e = boolean($e) } # need to convert JSON boolean to Perl boolean
    my $r = fn($p);
    reportError($p, $r, $e)  unless eq_deeply($r, $e);
}

my $total = scalar @$json;
printf("Attempted:\t%d\nOk:\t\t%d\nFailed:\t\t%d\n\n", $total, $total-$w, $w);

sub reportError {
    my ($p, $r, $e) = @_;
    say("Test [$i]");
    p($p);
    print("Result   => ");
    p($r);
    print("Expected => ");
    p($e);
    print("\n");
    $w++;
}
