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

{
    my ( $l, $b, $r, $t ) = ( 1.1, 2.2, 3.3, 4.4 );

    my $bb = Chipmunk::BB->new( $l, $b, $r, $t );
    my $v = [ 5.5, 6.6 ];

    my $expanded = $bb->expand($v);

    cmp_ok( abs $expanded->[0] - $l,      '<', 1e-5, 'expand l' );
    cmp_ok( abs $expanded->[1] - $b,      '<', 1e-5, 'expand b' );
    cmp_ok( abs $expanded->[2] - $v->[0], '<', 1e-5, 'expand r' );
    cmp_ok( abs $expanded->[3] - $v->[1], '<', 1e-5, 'expand t' );

    my $area = $bb->area();
    cmp_ok( abs( ( $r - $l ) * ( $t - $b ) - $area ), '<', 1e-5, 'area' );
}

# TODO: merged_area, segment_query, intersects_segment, clamp_vect,
#       wrap_vect

done_testing();

