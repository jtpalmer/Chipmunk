use strict;
use warnings;
use Test::More;
use Math::Trig qw( atan :pi );
use Chipmunk::Body;
use Chipmunk::SegmentShape;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body = Chipmunk::Body->new( $mass, $inertia );

    my ( $point_a, $point_b, $radius ) = ( [ 3.0, 4.0 ], [ 5.0, 6.0 ], 7.0 );

    my $segment
        = Chipmunk::SegmentShape->new( $body, $point_a, $point_b, $radius );

    isa_ok( $segment, 'Chipmunk::SegmentShape', 'new' );

    eval {
        my ( $neighbor_a, $neighbor_b ) = ( [ 3.1, 4.1 ], [ 5.1, 6.1 ] );
        $segment->set_neighbors( $neighbor_a, $neighbor_b );
        pass('set_neighbors');
        1;
    } or do {
        fail('set_neighbors');
    };

    cmp_ok( abs $segment->get_a()->[0] - $point_a->[0], '<', 1e-5,
        'get_a x' );
    cmp_ok( abs $segment->get_a()->[1] - $point_a->[1], '<', 1e-5,
        'get_a y' );

    cmp_ok( abs $segment->get_b()->[0] - $point_b->[0], '<', 1e-5,
        'get_b x' );
    cmp_ok( abs $segment->get_b()->[1] - $point_b->[1], '<', 1e-5,
        'get_b y' );

    my $angle
        = atan(
        ( $point_a->[1] - $point_b->[1] ) / ( $point_a->[0] - $point_b->[0] )
        );

    my $normal = [ cos( $angle + pi / 2 ), sin( $angle + pi / 2 ), ];

    cmp_ok( abs $segment->get_normal()->[0] - $normal->[0],
        '<', 1e-5, 'get_normal x' );
    cmp_ok( abs $segment->get_normal()->[1] - $normal->[1],
        '<', 1e-5, 'get_normal y' );

    cmp_ok( abs $segment->get_radius() - $radius, '<', 1e-5, 'get_radius' );
}

done_testing();

