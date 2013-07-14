use strict;
use warnings;
use Test::More;
use Chipmunk::Mat2x2 qw(:all);

{
    my $m = [ 1.1, 2.2, 3.3, 4.4 ];
    my $v = [ 5.5, 6.6 ];

    my $t = transform( $m, $v );

    cmp_ok( abs $t->[0] - ( $v->[0] * $m->[0] + $v->[1] * $m->[1] ),
        '<', 1e-5, 'transform x' );
    cmp_ok( abs $t->[1] - ( $v->[0] * $m->[2] + $v->[1] * $m->[3] ),
        '<', 1e-5, 'transform y' );
}

done_testing();

