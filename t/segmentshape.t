use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::SegmentShape;

# TODO: set_neighbors, get_normal

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body = Chipmunk::Body->new( $mass, $inertia );

    my ( $point_a, $point_b, $radius ) = ( [ 3.0, 4.0 ], [ 5.0, 6.0 ], 7.0 );

    my $segment
        = Chipmunk::SegmentShape->new( $body, $point_a, $point_b, $radius );

    ok( $segment, 'new' );
    isa_ok( $segment, 'Chipmunk::SegmentShape' );

    cmp_ok( abs $segment->get_a()->[0] - $point_a->[0], '<', 1e-5,
        'get_a x' );
    cmp_ok( abs $segment->get_a()->[1] - $point_a->[1], '<', 1e-5,
        'get_a y' );

    cmp_ok( abs $segment->get_b()->[0] - $point_b->[0], '<', 1e-5,
        'get_b x' );
    cmp_ok( abs $segment->get_b()->[1] - $point_b->[1], '<', 1e-5,
        'get_b y' );

    cmp_ok( abs $segment->get_radius() - $radius, '<', 1e-5, 'get_radius' );

    eval {
        $segment->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

done_testing();

