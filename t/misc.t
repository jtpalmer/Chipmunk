use strict;
use warnings;
use Test::More;
use Chipmunk qw(:all);
use Chipmunk::BB;
use Math::Trig qw(:pi);

eval {
    enable_segment_to_segment_collisions();
    pass('enable_segment_to_segment_collisions');
    1;
} or do {
    fail('enable_segment_to_segment_collisions');
};

{
    my $m = 4.0;
    my ( $r1, $r2 ) = ( 2.0, 3.0 );
    my $offset = [ 0.0, 0.0 ];

    my $moment = moment_for_circle( $m, $r1, $r2, $offset );
    cmp_ok( abs $moment - ( $m * ( $r1 * $r1 + $r2 * $r2 ) / 2.0 ),
        '<', 1e-5, 'moment_for_circle' );

    my $area = area_for_circle( $r1, $r2 );
    cmp_ok( abs $area - ( pi * $r2 * $r2 - pi * $r1 * $r1 ),
        '<', 1e-5, 'area_for_circle' );
}

{
    my $m = 5.0;
    my ( $a, $b ) = ( [ 1.0, 2.0 ], [ 5.0, 6.0 ] );
    my $r = 2.0;

    my ( $dx, $dy ) = ( $b->[0] - $a->[0], $b->[1] - $a->[1] );

    my ( $ox, $oy )
        = ( ( $b->[0] + $a->[0] ) / 2.0, ( $b->[1] + $a->[1] ) / 2.0 );

    my $moment = moment_for_segment( $m, $a, $b );
    cmp_ok(
        abs $moment - $m
            * ( ( $dx * $dx + $dy * $dy ) / 12.0 + $ox * $ox + $oy * $oy ),
        '<', 1e-5, 'moment_for_segment'
    );

    my $area = area_for_segment( $a, $b, $r );
    cmp_ok(
        abs $area - $r * ( pi * $r + 2.0 * sqrt( $dx * $dx + $dy * $dy ) ),
        '<', 1e-5, 'area_for_segment' );
}

{
    my $m = 5.0;
    my ( $w, $h ) = ( 2.0, 3.0 );
    my $verts = [ [ 0.0, 0.0 ], [ 0.0, $h ], [ $w, $h ], [ $w, 0.0 ] ];
    my $offset = [ 0.0, 0.0 ];

    my $moment = moment_for_poly( $m, $verts, $offset );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h ) / 3.0 ),
        '<', 1e-5, 'moment_for_poly' );

    my $area = area_for_poly($verts);
    cmp_ok( abs $area - ( $w * $h ), '<', 1e-5, 'area_for_poly' );
}

{
    my ( $w, $h ) = ( 2.0, 3.0 );
    my $verts = [ [ 0.0, 0.0 ], [ 0.0, $h ], [ $w, $h ], [ $w, 0.0 ] ];

    my $centroid = centroid_for_poly($verts);
    cmp_ok( abs $centroid->[0] - $w / 2.0, '<', 1e-5, 'centroid_for_poly x' );
    cmp_ok( abs $centroid->[1] - $h / 2.0, '<', 1e-5, 'centroid_for_poly y' );

    my $recentered = recenter_poly($verts);
    cmp_ok( abs $recentered->[0][0] - ( $verts->[0][0] - $w / 2.0 ),
        '<', 1e-5, 'recentered v0 x' );
    cmp_ok( abs $recentered->[0][1] - ( $verts->[0][1] - $h / 2.0 ),
        '<', 1e-5, 'recentered v0 y' );
}

{
    my $m = 4.0;
    my ( $w, $h ) = ( 2.0, 3.0 );

    my $moment = moment_for_box( $m, $w, $h );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h ) / 12.0 ),
        '<', 1e-5, 'moment_for_box' );
}

{
    my $m = 4.0;
    my ( $w, $h ) = ( 2.0, 3.0 );

    my $bb = Chipmunk::BB->new( 0.0, 0.0, $w, $h );

    my $moment = moment_for_box2( $m, $bb );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h ) / 3.0 ),
        '<', 1e-5, 'moment_for_box2' );
}

{
    my ( $w, $h ) = ( 2.0, 3.0 );
    my $concave = [
        [ 0.0,      0.0 ],
        [ 0.0,      $h ],
        [ $w / 2.0, $h / 2.0 ],
        [ $w,       $h ],
        [ $w,       0.0 ],
    ];

    my $convex = convex_hull($concave);

    is( scalar @$convex, 4, 'convex_hull correct number of vertices' );

    cmp_ok( abs $convex->[0][0] - $concave->[0][0],
        '<', 1e-5, 'convex_hull v0 x' );
    cmp_ok( abs $convex->[0][1] - $concave->[0][1],
        '<', 1e-5, 'convex_hull v0 y' );
    cmp_ok( abs $convex->[1][0] - $concave->[1][0],
        '<', 1e-5, 'convex_hull v1 x' );
    cmp_ok( abs $convex->[1][1] - $concave->[1][1],
        '<', 1e-5, 'convex_hull v1 y' );
    cmp_ok( abs $convex->[2][0] - $concave->[3][0],
        '<', 1e-5, 'convex_hull v2 x' );
    cmp_ok( abs $convex->[2][1] - $concave->[3][1],
        '<', 1e-5, 'convex_hull v2 y' );
    cmp_ok( abs $convex->[3][0] - $concave->[4][0],
        '<', 1e-5, 'convex_hull v3 x' );
    cmp_ok( abs $convex->[3][1] - $concave->[4][1],
        '<', 1e-5, 'convex_hull v3 y' );
}

done_testing();

