use strict;
use warnings;
use Test::More;
use Math::Trig qw(acos);
use List::Util qw( min max );
use Chipmunk::Vect qw(:all);

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $t  = 0.5;
    my $slerp = cpvslerp( $v1, $v2, $t );

    my $dot = cpvdot( cpvnormalize($v1), cpvnormalize($v2) );
    my $omega = acos( min( max( $dot, -1.0 ), 1.0 ) );

    my $denom = 1.0 / sin($omega);
    my $v3    = cpvadd(
        cpvmult( $v1, sin( ( 1.0 - $t ) * $omega ) * $denom ),
        cpvmult( $v2, sin( $t * $omega ) * $denom )
    );

    cmp_ok( abs $slerp->[0] - $v3->[0], '<', 1e-5, 'cpvslerp x' );
    cmp_ok( abs $slerp->[1] - $v3->[1], '<', 1e-5, 'cpvslerp y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $a  = 0.5;
    my $slerp = cpvslerpconst( $v1, $v2, $a );

    my $dot = cpvdot( cpvnormalize($v1), cpvnormalize($v2) );
    my $omega = acos( min( max( $dot, -1.0 ), 1.0 ) );

    my $v3 = cpvslerp( $v1, $v2, min( $a, $omega ) / $omega );

    cmp_ok( abs $slerp->[0] - $v3->[0], '<', 1e-5, 'cpvslerpconst x' );
    cmp_ok( abs $slerp->[1] - $v3->[1], '<', 1e-5, 'cpvslerpconst y' );
}

{
    my $v = [ 1.1, 2.2 ];
    my $str = cpvstr($v);
    my ( $x, $y ) = $str =~ m/^\( ([^,]*) , ([^,]*) \)$/msx;
    cmp_ok( abs $x - $v->[0], '<', 1e-2, 'cpstr x' );
    cmp_ok( abs $y - $v->[1], '<', 1e-2, 'cpstr y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 1.1, 2.2 ];
    my $v3 = [ 3.3, 4.4 ];

    ok( cpveql( $v1, $v2 ), 'cpveql' );
    ok( !cpveql( $v1, $v3 ), 'cpveql (not equal)' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $sum = cpvadd( $v1, $v2 );
    cmp_ok( abs $sum->[0] - ( $v1->[0] + $v2->[0] ), '<', 1e-5, 'cpvadd x' );
    cmp_ok( abs $sum->[1] - ( $v1->[1] + $v2->[1] ), '<', 1e-5, 'cpvadd y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $diff = cpvsub( $v1, $v2 );
    cmp_ok( abs $diff->[0] - ( $v1->[0] - $v2->[0] ), '<', 1e-5, 'cpvsub x' );
    cmp_ok( abs $diff->[1] - ( $v1->[1] - $v2->[1] ), '<', 1e-5, 'cpvsub y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $neg = cpvneg($v1);
    cmp_ok( abs $neg->[0] - ( -$v1->[0] ), '<', 1e-5, 'cpvneg x' );
    cmp_ok( abs $neg->[1] - ( -$v1->[1] ), '<', 1e-5, 'cpvneg y' );

}

{
    my $v       = [ 1.1, 2.2 ];
    my $s       = 3.3;
    my $product = cpvmult( $v, $s );
    cmp_ok( abs $product->[0] - ( $s * $v->[0] ), '<', 1e-5, 'cpvmult x' );
    cmp_ok( abs $product->[1] - ( $s * $v->[1] ), '<', 1e-5, 'cpvmult y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $dot = cpvdot( $v1, $v2 );
    cmp_ok( abs $dot - ( $v1->[0] * $v2->[0] + $v1->[1] * $v2->[1] ),
        '<', 1e-5, 'cpvdot' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $cross = cpvcross( $v1, $v2 );
    cmp_ok( abs $cross - ( $v1->[0] * $v2->[1] - $v1->[1] * $v2->[0] ),
        '<', 1e-5, 'cpvcross' );
}

{
    my $v = [ 1.1, 2.2 ];
    my $perp = cpvperp($v);
    cmp_ok( abs $perp->[0] - ( -$v->[1] ), '<', 1e-5, 'cpvperp x' );
    cmp_ok( abs $perp->[1] - $v->[0], '<', 1e-5, 'cpvperp y' );
}


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

