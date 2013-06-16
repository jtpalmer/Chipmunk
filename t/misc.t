use strict;
use warnings;
use Test::More;
use Chipmunk;
use Chipmunk::BB;
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

{
    my $m = 5.0;
    my ( $w, $h ) = ( 2.0, 3.0 );
    my $verts = [ [ 0.0, 0.0 ], [ 0.0, $h ], [ $w, $h ], [ $w, 0.0 ] ];
    my $offset = [ 0.0, 0.0 ];

    my $moment = Chipmunk::moment_for_poly( $m, $verts, $offset );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h ) / 3.0 ),
        '<', 1e-5, 'moment_for_poly' );

    my $area = Chipmunk::area_for_poly($verts);
    cmp_ok( abs $area - ( $w * $h ), '<', 1e-5, 'area_for_poly' );
}

{
    my $m = 4.0;
    my ( $w, $h ) = ( 2.0, 3.0 );

    my $moment = Chipmunk::moment_for_box( $m, $w, $h );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h ) / 12.0 ),
        '<', 1e-5, 'moment_for_box' );
}

{
    my $m = 4.0;
    my ( $w, $h ) = ( 2.0, 3.0 );

    my $bb = Chipmunk::BB->new( 0.0, 0.0, $w, $h );

    my $moment = Chipmunk::moment_for_box2( $m, $bb );
    cmp_ok( abs $moment - ( $m * ( $w * $w + $h * $h) / 3.0 ),
        '<', 1e-5, 'moment_for_box2' );
}

done_testing();

