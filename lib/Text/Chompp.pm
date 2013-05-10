package Text::Chompp;

use warnings;
use strict;

use base 'Exporter';
our @EXPORT_OK = qw/ chompp chopp /;

=head1 NAME

Text::Chompp - A chomp and chop that will return ('pass through') the result

=head1 SYNOPSIS


=head1 DESCRIPTON

=cut

sub chompp  {
    my @val = @_;
    @val = ($_) unless @val;

    chomp foreach @val;
    return wantarray ? @val : $val[0];
}

sub chopp  {
    my @val = @_;
    @val = ($_) unless @val;

    chop foreach @val;
    return wantarray ? @val : $val[0];
}

1;

