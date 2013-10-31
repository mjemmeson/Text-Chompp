# chompp.t

use Test::Most;

use Text::Chompp qw/ chompp /;

foreach my $words ( [ "hello\n", "there\n" ], [ "hello", "there" ] ) {

    note $words->[0] =~ /\n$/ ? "with new line" : "without new line";

    my @chomped = map { s/\n$//; $_ } @{$words};

    my @tests = (
        {   name   => 'scalar',
            sub    => sub { chompp $words->[0] },
            result => $chomped[0],
        },
        {   name   => 'list',
            sub    => sub { [ chompp $words->[0], $words->[1] ] },
            result => [@chomped],
        },
        {   name => 'map',
            sub  => sub {
                [ map {chompp} $words->[0], $words->[1] ];
            },
            result => [@chomped],
        },
        {   name => 'map with $_',
            sub  => sub {
                [ map { chompp $_ } $words->[0], $words->[1] ];
            },
            result => [@chomped],
        },
        {   name => 'foreach',
            sub  => sub {
                my @chompped;
                push @chompped, chompp foreach ( $words->[0], $words->[1] );
                return \@chompped;
            },
            result => [@chomped],
        },

    );

    foreach my $test (@tests) {

        note $test->{name};

        is_deeply $test->{sub}->(), $test->{result}, "result ok";
    }

    note "testing input unchanged";

    my $input = $words->[0];
    ok my $output = chompp($input), "chompp";

    is $input, $words->[0], "input unchanged";
    is $output, $chomped[0], "output chompped";

}

done_testing();

