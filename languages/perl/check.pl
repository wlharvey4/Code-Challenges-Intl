#! /usr/bin/env perl5

# languages/perl/check.pl
# =============================================================================
# CREATED: 2018-05-19
# UPDATED: 2018-10-24
# VERSION: 3.1.1
# AUTHOR : wlharvey4
# ABOUT  : Test script for perl Perl code challenges
# USAGE  : ./check <code-challenge>
# NOTES: : While coding the challenges in OO paradigm might be cumbersome in
#	   Perl, yet there are real benefits to doing9 so, i.e., no aliasing of
#	   typeglobs is necessary, and therefore no need for 'no strict refs',
#	   nor for a global variable and checking for equality is easy and
#	   natural.
# CHANGE-LOG:
# .............................................................................
# v1.1.0 2018-07-04
# -- added `eval' (i.e., `try') around check for $e->isa Boolean because a null
#    $e throws an error.
# .............................................................................
# v1.1.1 2018-09-04
# -- changed the interpreter from perl to perl5
# .............................................................................
# v2.0.0 2018-09-07
# -- Added package names to each perl module; updated routine to alias the
#    package name along with the code challenge name
# .............................................................................
# v2.1.0 2018-09-08
# -- Added `bigint' pragma to `fibonacci' code challenge, which broke the
#    eq_deeply' check because the return value is a Math::BigInt object; so now
#    check to see if the return value is a Math::BigInt object, and if so, then
#    convert the `expected' value to a Math::BigInt object also
# .............................................................................
# v3.0.0 2018-10-24T0015
# -- Refactored to interface with OO code challenge; works with strCount()
# .............................................................................
# v3.1.0 2018-10-24T00:45
# -- Made further refactorings; gave variables better names; reduced comments;
# -- removed all global variables
# .............................................................................
# v3.1.1 2018-10-24T21:40
# -- refactored method output() to method cc(); nothing needed to be changed
#    to work with complete fizzbuzz refactoring into Perl OO style.
# -----------------------------------------------------------------------------

# pragmas
use strict;
use warnings;
use v5.16;
use boolean;	           # gives access to Perl boolean values

# Utility libraries
use Cwd 'abs_path';        # provides abs_path() function
use File::Spec::Functions; # provides &catfile() for portable path creation
use Data::Printer output => 'stdout'; # provides &p() (pretty-printing of data)
use JSON;                  # provides &decode_json()

# CONSTANTS
my $USAGE      = qq{USAGE: ./check <code-challenge>\n};
my $CHALLENGES = abs_path("../../challenges");
my $JSONEXT    = ".json";
my $PERL       = "perl";
my $PERLPM     = ".pm";

# Variables
my $cc;         # the name of the code challenge from the CL invocation
my $ccPM;       # absolute path to the code challenge module
my $ccJSON;     # absolute path to the code challenge JSON data file
my $jsonData;   # holds the JSON data in memory
my $packg;      # code challenge Package name
my ($i, $w);    # $i :=  test number; $w := number of tests found wrong

# get the Code Challenge name from the command-line argument and create the
# package name
$cc = $ARGV[0] || do {
    print $USAGE; print qq{ERROR: missing <code-challenge>\n}; exit 1;
};
$packg = ucfirst $cc;

# construct paths to resources
$ccJSON = catfile($CHALLENGES, $cc, $cc.$JSONEXT);
$ccPM   = catfile($CHALLENGES, $cc, $PERL, $cc.$PERLPM);
unless (-e $ccPM) {
    print $USAGE;
    print qq{ERROR: $ccPM does not exist\n};
    exit 1;
}

require $ccPM;     # load the code challenge module
$jsonData = eval { # load the JSON data into an Array ref
    local $/;
    open JSON, '<', $ccJSON;
    decode_json(<JSON>);
} || die $@;

($i, $w) = (0, 0);
for my $test (@$jsonData) { # iterate over the JSON tests
    $i++;
    my $params   = $test->{params};
    my $expected = $test->{expected};
    # need to convert JSON boolean to Perl boolean because
    # a null $e will throw an error
    if (eval { $expected->isa("JSON::PP::Boolean") }) {  
	$expected = boolean($expected)			  
    }

    my $result = $packg->$cc($params); # when using OO Perl, there is no need 
                                       # to alias type globs

    # if a code challenge uses the `bigint' pragma (e.g., `fibonacci'), need to
    # convert the `expected' value to a Math::BigInt object in order to
    # compare; don't want to simply load the `bigint' pragma because then all
    # math operations will be converted into Math::BigInt ones
    if ($result->cc()->isa("Math::BigInt")) {
	$expected = Math::BigInt->new($expected);
    }
    assertError($params, $result, $expected)  unless $result->eq($expected);
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
    p($r->cc());
    print("Package   => ");
    p($r);
    print("----------------------------------------------------\n");
    $w++;
}
