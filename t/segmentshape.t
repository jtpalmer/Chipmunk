use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::SegmentShape;

my ( $mass, $inertia ) = ( 1.0, 2.0 );
my $body = Chipmunk::Body->new( $mass, $inertia );

my ( $point_a, $point_b, $radius ) = ( [ 3.0, 4.0 ], [ 5.0, 6.0 ], 7.0 );

my $segment
    = Chipmunk::SegmentShape->new( $body, $point_a, $point_b, $radius );

ok( $segment, 'new' );
isa_ok( $segment, 'Chipmunk::SegmentShape' );

my $friction = 3.0;

$segment->set_friction($friction);

cmp_ok( abs $segment->get_friction() - $friction, '<', 1e-5, 'get_friction' );

eval {
    $segment->free();
    pass('free');
    1;
} or do {
    fail('free');
};

done_testing();

