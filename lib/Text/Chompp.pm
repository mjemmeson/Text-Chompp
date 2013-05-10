package Text::Chompp;

# ABSTRACT: chomp and chop replacements that pass the changed value(s) back

# VERSION

use warnings;
use strict;

use base 'Exporter';
our @EXPORT_OK = qw/ chompp chopp /;

=head1 SYNOPSIS

  use Text::Chompp qw/ chompp chopp /;
  
  ...
  
  # all the following work:
  my $chomped = chompp $string;
  my $chomped = chompp $_;
  my @chomped = map { chompp } @strings;
  my @chomped = chompp @strings;
  
  foreach (<FILE>) {
    chompp;
    push @chomped;
  }
   
  # ... etc ...

=head1 DESCRIPTON

=cut

sub chompp {
    my @val = @_;
    @val = ($_) unless @val;

    chomp foreach @val;
    return wantarray ? @val : $val[0];
}

sub chopp {
    my @val = @_;
    @val = ($_) unless @val;

    chop foreach @val;
    return wantarray ? @val : $val[0];
}

1;

