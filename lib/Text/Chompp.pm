package Text::Chompp;

use warnings;
use strict;

use base 'Exporter';
our @EXPORT_OK = qw/ chompp chopp /;

# ABSTRACT: chomp and chop replacements that pass the changed value(s) back

# VERSION

=head1 SYNOPSIS

  use Text::Chompp qw/ chompp chopp /;
  
  ...
  
  # all the following work:
  my $chomped = chompp $string;
  my $chomped = chompp $_;
  my @chomped = map { chompp } @strings;
  my @chomped = chompp @strings;
  
  foreach (<FILE>) {
    push @chomped, chompp;
  }
   
  # ... etc ...

=head1 DESCRIPTION

Alternative to the builtins C<chop> and C<chomp>, which leave the original
intact, and instead return the altered value. The intention is to take the
same arguments as the originals.

=head1 LIMITATIONS

Text::Chompp will not process the values of hashes (as chop/chomp do).

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

=head1 SEE ALSO

Text::Chomped - requires alternative syntax for lists

=cut

1;

