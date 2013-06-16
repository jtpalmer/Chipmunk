use strict;
use warnings;
use Test::More;
use Chipmunk;
use Math::Trig qw(:pi);

{
    my $m = 4.0;
    my ( $r1, $r2 ) = ( 2.0, 3.0 );
    my $offset = [ 0.0, 0.0 ];

    my $moment = Chipmunk::moment_for_circle( $m, $r1, $r2, $offset );
    cmp_ok( abs $moment - ( $m * ( $r1 * $r1 + $r2 * $r2 ) / 2.0 ),
        '<', 1e-5, 'moment_for_circle' );

    my $area = Chipmunk::area_for_circle( $r1, $r2 );
    cmp_ok( abs $area - ( pi * $r2 * $r2 - pi * $r1 * $r1 ),
        '<', 1e-5, 'area_for_circle' );
}

done_testing();

