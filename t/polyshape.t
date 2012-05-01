#!perl
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

is( $poly->get_friction(), $friction, 'get_friction' );

eval {
    $verts = [ [ 0, 0 ], [ 1, 0 ], [ 0, 1 ] ];
    Chipmunk::PolyShape->new( $body, $verts );
};
if ($@) {
    pass('vertices must be clockwise');
}
else {
    fail('vertices must be clockwise');
}

done_testing();

