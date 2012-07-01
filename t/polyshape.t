use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::PolyShape;

my ( $mass, $inertia ) = ( 1.0, 2.0 );
my $body = Chipmunk::Body->new( $mass, $inertia );

my $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];

my $poly = Chipmunk::PolyShape->new( $body, $verts );

isa_ok( $poly, 'Chipmunk::PolyShape' );

is( $poly->get_num_verts(), scalar @$verts, 'get_num_verts' );

my $friction = 3.0;

$poly->set_friction($friction);

cmp_ok( abs $poly->get_friction() - $friction, '<', 1e-5, 'get_friction' );

eval {
    $poly->free();
    pass('free');
    1;
} or do {
    fail('free');
};

eval {
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body = Chipmunk::Body->new( $mass, $inertia );
    my $verts = [ [ 0, 0 ], [ 1, 0 ], [ 0, 1 ] ];
    Chipmunk::PolyShape->new( $body, $verts );
    fail('vertices must be clockwise');
    1;
} or do {
    pass('vertices must be clockwise');
};

done_testing();

