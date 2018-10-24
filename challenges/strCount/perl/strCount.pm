# challenges/strCount/perl/strCount.pm
# =============================================================================
# CREATED: 2018-06-13
# UPDATED: 2018-10-23
# VERSION: 1.1.1
# AUTHOR : wlharvey4
# USAGE  : perl5 strCount.pm <str1> <str2>
# ABOUT  : strCount challenge implemented in Perl
# NOTES  : The  RE expresion  /$re/g returns an  array of matches;  returning
#        : the  scalar value  of  an  array returns the array's size.
# CHANGE_LOG:
# .............................................................................
# version 1.1.0 2018-09-07
# -- A dded package StrCount
# -- converted into modulino, callable as either a module or script
# .............................................................................
# version 2.0.0 2018-10-23T19:00
# -- Added README.md; removed description of challenge from About
# -- Completely refactored module using object-oriented paradyme in order to
#    to compare with Ruby; much, much harder to do, with no benefit to
#    readability and probably not worth the effort for this little code; but,
#    nevertheless it was a good exercise in coding Perl using Objects.
# -----------------------------------------------------------------------------

package StrCount;

use strict;
use warnings;
use v5.16;

my $USAGE = qq{USAGE: strCount str1 str2
where str1 is random length string (may be empty) and str2 is single character.\n};

# @_ := input := {'str1' => string, 'str2' => string}
# 'str1' is random length string (including empty string)
# 'str2' is single character (may not be empty)
# integer represents count of 'str2' in 'str1'
sub strCount {
    my $class = shift;
    my ($input) = @_;
    my ($str1, $str2) = ($input->{str1}, $input->{str2});

    my $self = bless {str => $str1, char => $str2}, $class;
    $self->calculate();
}

sub calculate {
    my $self = shift;
    my $char = $self->char();
    my @c = $self->str() =~ /$char/g;
    $self->count(scalar @c);
    $self;
}

sub str {
    my $self = shift;
    if (@_) { $self->{str} = shift }
    $self->{str};
}

sub char {
    my $self = shift;
    if (@_) { $self->{char} = shift }
    $self->{char};
}

sub count {
    my $self = shift;
    if (@_) { $self->{count} = shift }
    $self->{count};
}

sub inspect {
    my $self = shift;
    my ($str, $char, $count) = ($self->str(), $self->char(), $self->count());
    print "strCount of '$char' in '$str' is $count.\n";
}

# @ARGV := (string, string)
sub main {
    my ($str1, $str2) = eval { @ARGV if @ARGV == 2 };
    unless ($str1 && $str2) { print $USAGE; exit 1; }

    my $sc = StrCount->strCount({ str1 => $str1, str2 => $str2 });
    $sc->inspect();
}

main(@ARGV) unless caller();

1;
