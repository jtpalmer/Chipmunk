use strict;
use warnings;
use Test::More;
use Chipmunk::BB;
use List::Util qw( max min );

{
    my ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    my $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );
    isa_ok( $bb, 'Chipmunk::BB', 'new' );

    cmp_ok( abs $bb->[0] - $left,   '<', 1e-5, '->[0]' );
    cmp_ok( abs $bb->[1] - $bottom, '<', 1e-5, '->[1]' );
    cmp_ok( abs $bb->[2] - $right,  '<', 1e-5, '->[2]' );
    cmp_ok( abs $bb->[3] - $top,    '<', 1e-5, '->[3]' );

    my ( $point, $radius ) = ( [ 10, 20 ], 5 );
    my $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );
    isa_ok( $circle_bb, 'Chipmunk::BB', 'new_for_circle' );

    ok( $bb->intersects($circle_bb), 'intersects' );

    ok( $bb->contains_bb($circle_bb), 'contains_bb' );

    ok( $bb->contains_vect( [ 10, 20 ] ), 'contains_vect' );

    my $p   = [ [ 10.0, 20.0, 30.0, 40.0 ], [ 15.0, 25.0, 35.0, 45.0 ] ];
    my $bb1 = Chipmunk::BB->new( @{ $p->[0] } );
    my $bb2 = Chipmunk::BB->new( @{ $p->[1] } );

    my $merged = $bb1->merge($bb2);
    isa_ok( $bb, 'Chipmunk::BB', 'merged' );
    cmp_ok( abs $merged->[0] - min( $p->[0][0], $p->[1][0] ),
        '<', 1e-5, 'merge left' );
    cmp_ok( abs $merged->[1] - min( $p->[0][1], $p->[1][1] ),
        '<', 1e-5, 'merge bottom' );
    cmp_ok( abs $merged->[2] - max( $p->[0][2], $p->[1][2] ),
        '<', 1e-5, 'merge right' );
    cmp_ok( abs $merged->[3] - max( $p->[0][3], $p->[1][3] ),
        '<', 1e-5, 'merge top' );
}

{
    my ( $l, $b, $r, $t ) = ( 1.1, 2.2, 3.3, 4.4 );
    my $bb = Chipmunk::BB->new( $l, $b, $r, $t );
    my $v = [ 5.5, 6.6 ];

    my $expanded = $bb->expand($v);
    cmp_ok( abs $expanded->[0] - $l,      '<', 1e-5, 'expand left' );
    cmp_ok( abs $expanded->[1] - $b,      '<', 1e-5, 'expand bottom' );
    cmp_ok( abs $expanded->[2] - $v->[0], '<', 1e-5, 'expand right' );
    cmp_ok( abs $expanded->[3] - $v->[1], '<', 1e-5, 'expand top' );

    my $area = $bb->area();
    cmp_ok( abs( ( $r - $l ) * ( $t - $b ) - $area ), '<', 1e-5, 'area' );
}

{
    my ( $l_a, $b_a, $r_a, $t_a ) = ( 1.1, 3.3, 5.5, 7.7 );
    my $bb_a = Chipmunk::BB->new( $l_a, $b_a, $r_a, $t_a );

    my ( $l_b, $b_b, $r_b, $t_b ) = ( 2.2, 4.4, 6.6, 8.8 );
    my $bb_b = Chipmunk::BB->new( $l_b, $b_b, $r_b, $t_b );

    my $area = $bb_a->merged_area($bb_b);
    cmp_ok(
        abs(  ( max( $r_a, $r_b ) - min( $l_a, $l_b ) )
            * ( max( $t_a, $t_b ) - min( $b_a, $b_b ) ) - $area
        ),
        '<', 1e-5,
        'merged_area'
    );
}

{
    my ( $l, $b, $r, $t ) = ( 1.0, 2.0, 3.0, 4.0 );
    my $bb = Chipmunk::BB->new( $l, $b, $r, $t );

    # Segment that is half inside the bounding box.
    my $v_a = [ 0.0, 3.5 ];
    my $v_b = [ 2.0, 3.5 ];

    my $result = $bb->segment_query( $v_a, $v_b );
    cmp_ok( abs $result - 0.5, '<', 1e-5, 'segment_query' );

    my $intersects = $bb->intersects_segment( $v_a, $v_b );
    ok( $intersects, 'intersects_segment' );

    $intersects = $bb->intersects_segment( [ 5.5, 6.6 ], [ 7.7, 8.8 ] );
    ok( !$intersects, "intersects_segment (doesn't intersect)" );
}

{
    my ( $l, $b, $r, $t ) = ( 1.1, 2.4, 3.9, 4.6 );
    my $bb = Chipmunk::BB->new( $l, $b, $r, $t );
    my $v = [ 5.5, 6.6 ];

    my $clamped = $bb->clamp_vect($v);
    cmp_ok( abs $clamped->[0] - $bb->[2], '<', 1e-5, 'clamp x' );
    cmp_ok( abs $clamped->[1] - $bb->[3], '<', 1e-5, 'clamp y' );
}

# TODO: wrap_vect

done_testing();

