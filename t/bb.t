use strict;
use warnings;
use Test::More;
use Chipmunk::BB;
use List::Util qw( max min );

# TODO: expand, area, merged_area, segment_query, intersects_segment,
#       clamp_vect, wrap_vect

{
    my ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    my $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );
    ok( $bb, 'new' );
    isa_ok( $bb, 'Chipmunk::BB' );

    cmp_ok( abs $bb->[0] - $left,   '<', 1e-5, '->[0]' );
    cmp_ok( abs $bb->[1] - $bottom, '<', 1e-5, '->[1]' );
    cmp_ok( abs $bb->[2] - $right,  '<', 1e-5, '->[2]' );
    cmp_ok( abs $bb->[3] - $top,    '<', 1e-5, '->[3]' );

    my ( $point, $radius ) = ( [ 10, 20 ], 5 );
    my $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );
    ok( $circle_bb, 'new_for_circle' );
    isa_ok( $circle_bb, 'Chipmunk::BB' );

    ok( $bb->intersects($circle_bb), 'intersects' );

    ok( $bb->contains_bb($circle_bb), 'contains_bb' );

    ok( $bb->contains_vect( [ 10, 20 ] ), 'contains_vect' );

    my $p      = [ [ 10.0, 20.0, 30.0, 40.0 ], [ 15.0, 25.0, 35.0, 45.0 ] ];
    my $bb1    = Chipmunk::BB->new( @{ $p->[0] } );
    my $bb2    = Chipmunk::BB->new( @{ $p->[1] } );
    my $merged = $bb1->merge($bb2);
    isa_ok( $bb, 'Chipmunk::BB', 'merged' );
    cmp_ok( abs $merged->[0] - min( $p->[0][0], $p->[1][0] ),
        '<', 1e-5, 'merged left' );
    cmp_ok( abs $merged->[1] - min( $p->[0][1], $p->[1][1] ),
        '<', 1e-5, 'merged bottom' );
    cmp_ok( abs $merged->[2] - max( $p->[0][2], $p->[1][2] ),
        '<', 1e-5, 'merged right' );
    cmp_ok( abs $merged->[3] - max( $p->[0][3], $p->[1][3] ),
        '<', 1e-5, 'merged top' );
}

done_testing();

