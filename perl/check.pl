#! /usr/bin/env perl

# perl/check.pl
# ====================================================
# CREATED: 2018-05-19
# VERSION 2.0.0
# AUTHOR: wlharvey4
# ABOUT: Test runner for perl implementations
# NOTES:
# ----------------------------------------------------

use strict;
no strict "refs";
use warnings;
use v5.16;
use lib '..';

use Data::Printer output => 'stdout';
use JSON;
use Test::Deep::NoTest;

our $fn;	# the aliased code challenge subroutine
my $cc;		# the name of the code challenge from the CL invocation
my $ccPM;	# the code challenge function path
my $ccJSON;	# the code challenge data path
my $json;	# the code challenge data storage

$cc = $ARGV[0];
unless ($cc) {
    die qq{You need to include the name of a code challenge: i.e., './check <code-challenge>'}
}

$ccPM = "${cc}/perl/${cc}.pm";
$ccJSON = "../${cc}/${cc}.json";

require $ccPM;
*fn = *{$cc};
$json = eval { # load and decode the test data into a Perl hash reference
    local $/;
    open JSON, '<', $ccJSON;
    decode_json(<JSON>);
} || die $@;

my ($i, $w) = (0, 0); # $i :=  test number; $w := number of tests found wrong
for my $test (@$json) {
    $i++;
    my $n = $test->{params};
    my $e = $test->{expected};
    my $r = fn($n);
    reportError($i, \$w, $n, $r, $e)  unless eq_deeply($r, $e);
}

printf("Ran %d tests, with %d failure(s)\n\n", $#$json + 1, $w);

sub reportError {
    my ($i, $w, $n, $r, $e) = @_;
    say("Test [$i]");
    p($n);
    print("Result   => ");
    p($r);
    print("Expected => ");
    p($e);
    print("\n");
    ${$w}++;
}
