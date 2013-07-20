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
    my $v = [ 1.1, 2.2 ];
    my $rperp = cpvrperp($v);
    cmp_ok( abs $rperp->[0] - $v->[1], '<', 1e-5, 'cpvrperp x' );
    cmp_ok( abs $rperp->[1] - ( -$v->[0] ), '<', 1e-5, 'cpvrperp y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $projection = cpvproject( $v1, $v2 );
    my $v3 = cpvmult( $v2, cpvdot( $v1, $v2 ) / cpvdot( $v2, $v2 ) );
    cmp_ok( abs $projection->[0] - $v3->[0], '<', 1e-5, 'cpvproject x' );
    cmp_ok( abs $projection->[1] - $v3->[1], '<', 1e-5, 'cpvproject y' );
}

{
    my $angle = 1.1;
    my $v     = cpvforangle($angle);
    cmp_ok( abs $v->[0] - cos($angle), '<', 1e-5, 'cpvforangle x' );
    cmp_ok( abs $v->[1] - sin($angle), '<', 1e-5, 'cpvforangle y' );
}

{
    my $v = [ 1.1, 2.2 ];
    my $angle = cpvtoangle($v);
    cmp_ok( abs $angle - atan2( $v->[1], $v->[0] ), '<', 1e-5, 'cpvtoangle' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $rotated = cpvrotate( $v1, $v2 );
    my $v3 = [
        $v1->[0] * $v2->[0] - $v1->[1] * $v2->[1],
        $v1->[0] * $v2->[1] + $v1->[1] * $v2->[0]
    ];
    cmp_ok( abs $rotated->[0] - $v3->[0], '<', 1e-5, 'cpvrotate x' );
    cmp_ok( abs $rotated->[1] - $v3->[1], '<', 1e-5, 'cpvrotate y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $unrotated = cpvunrotate( $v1, $v2 );
    my $v3 = [
        $v1->[0] * $v2->[0] + $v1->[1] * $v2->[1],
        $v1->[1] * $v2->[0] - $v1->[0] * $v2->[1]
    ];
    cmp_ok( abs $unrotated->[0] - $v3->[0], '<', 1e-5, 'cpvrotate x' );
    cmp_ok( abs $unrotated->[1] - $v3->[1], '<', 1e-5, 'cpvrotate y' );
}

{
    my $v = [ 1.1, 2.2 ];
    my $lengthsq = cpvlengthsq($v);
    cmp_ok( abs $lengthsq - cpvdot( $v, $v ), '<', 1e-5, 'cpvlengthsq' );
}

{
    my $v = [ 1.1, 2.2 ];
    my $length = cpvlength($v);
    cmp_ok( abs $length - sqrt( cpvdot( $v, $v ) ), '<', 1e-5, 'cpvlength' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $t  = 0.5;
    my $lerp = cpvlerp( $v1, $v2, $t );
    my $v3 = [
        $t * $v1->[0] + ( 1 - $t ) * $v2->[0],
        $t * $v1->[1] + ( 1 - $t ) * $v2->[1]
    ];
    cmp_ok( abs $lerp->[0] - $v3->[0], '<', 1e-5, 'cpvlerp x' );
    cmp_ok( abs $lerp->[1] - $v3->[1], '<', 1e-5, 'cpvlerp y' );
}

{
    my $v1         = [ 1.1, 2.2 ];
    my $normalized = cpvnormalize($v1);
    my $v2         = cpvmult( $v1, 1.0 / cpvlength($v1) );
    cmp_ok( abs $normalized->[0] - $v2->[0], '<', 1e-5, 'cpvnormalize x' );
    cmp_ok( abs $normalized->[1] - $v2->[1], '<', 1e-5, 'cpvnormalize y' );
}

{
    my $v1         = [ 1.1, 2.2 ];
    my $normalized = cpvnormalize_safe($v1);
    my $v2         = cpvmult( $v1, 1.0 / cpvlength($v1) );
    cmp_ok( abs $normalized->[0] - $v2->[0],
        '<', 1e-5, 'cpvnormalize_safe x' );
    cmp_ok( abs $normalized->[1] - $v2->[1],
        '<', 1e-5, 'cpvnormalize_safe y' );
}

{
    my $v1      = [ 1.1, 2.2 ];
    my $len     = 0.5;
    my $clamped = cpvclamp( $v1, $len );
    my $v2      = cpvmult( cpvnormalize($v1), $len );
    cmp_ok( abs $clamped->[0] - $v2->[0], '<', 1e-5, 'cpvclamp x' );
    cmp_ok( abs $clamped->[1] - $v2->[1], '<', 1e-5, 'cpvclamp y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $d  = 0.5;
    my $lerp = cpvlerpconst( $v1, $v2, $d );
    my $v3 = cpvadd( $v1, cpvclamp( cpvsub( $v2, $v1 ), $d ) );
    cmp_ok( abs $lerp->[0] - $v3->[0], '<', 1e-5, 'cpvlerpconst x' );
    cmp_ok( abs $lerp->[1] - $v3->[1], '<', 1e-5, 'cpvlerpconst y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $dist = cpvdist( $v1, $v2 );
    cmp_ok( abs $dist - cpvlength( cpvsub( $v1, $v2 ) ),
        '<', 1e-5, 'cpvdist' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $distsq = cpvdistsq( $v1, $v2 );
    cmp_ok( abs $distsq - cpvlengthsq( cpvsub( $v1, $v2 ) ),
        '<', 1e-5, 'cpvdistsq' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    ok( cpvnear( $v1, $v2, 10.0 ), 'cpvnear' );
    ok( !cpvnear( $v1, $v2, 1.0 ), 'cpvnear (not near)' );
}

done_testing();

