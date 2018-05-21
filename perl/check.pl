#! /usr/bin/env perl

# perl/check.pl
# ====================================================
# CREATED: 2018-05-19
# VERSION 2.1.0
# AUTHOR: wlharvey4
# ABOUT: Test script for perl implementations
# USAGE: ./check <code-challenge>
# NOTES:
# ----------------------------------------------------

use strict;
no  strict "refs"; # allows aliasing using variables
use warnings;
use v5.16;
use lib '..';	# gives access to code challenges as modules

use File::Spec::Functions; # provides &catfile()
use Data::Printer output => 'stdout'; # provides &p() (pretty-printer)
use JSON;		# provides &decode_json()
use Test::Deep::NoTest; # provides &eq_deeply()

our $fn;	# the aliased code challenge subroutine
my $cc;		# the name of the code challenge from the CL invocation
my $ccPM;	# the code challenge module path
my $ccJSON;	# the code challenge data path
my $json;	# the code challenge data storage

$cc = $ARGV[0]; # the code challenge needs to be give on command-line as argument
unless ($cc) {
    die qq{You need to include the name of a code challenge: i.e., './check <code-challenge>'}
}

# construct the paths portably
$ccPM = catfile(${cc}, 'perl', ${cc}.'.pm');
$ccJSON = catfile('..', ${cc}, ${cc}.'.json');

require $ccPM; # load the code challenge module
*fn = *{$cc};  # alias the code challenge name (&{$cc}) to &fn
$json = eval { # load and decode the test data into a Perl hash reference
    local $/;
    open JSON, '<', $ccJSON;
    decode_json(<JSON>);
} || die $@;

our ($i, $w) = (0, 0); # $i :=  test number; $w := number of tests found wrong
for my $test (@$json) {
    $i++;
    my $p = $test->{params};
    my $e = $test->{expected};
    my $r = fn($p);
    reportError($p, $r, $e)  unless eq_deeply($r, $e);
}

printf("Ran %d tests, with %d failure(s)\n\n", $#$json + 1, $w);

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
