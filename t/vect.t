use strict;
use warnings;
use Test::More;
use Chipmunk::Vect qw(:all);

# TODO: cpvect_cpvslerp

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $t  = 0.5;

    my $lerp = cpvlerp( $v1, $v2, $t );
    cmp_ok( abs $lerp->[0] - ( $t * $v1->[0] + ( 1 - $t ) * $v2->[0] ),
        '<', 1e-5, 'cpvlerp x' );
    cmp_ok( abs $lerp->[1] - ( $t * $v1->[1] + ( 1 - $t ) * $v2->[1] ),
        '<', 1e-5, 'cpvlerp y' );
}

done_testing();

