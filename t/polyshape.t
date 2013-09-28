use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::PolyShape;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body = Chipmunk::Body->new( $mass, $inertia );

    my $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];
    my $poly = Chipmunk::PolyShape->new( $body, $verts );

    isa_ok( $poly, 'Chipmunk::PolyShape', 'new' );

    is( $poly->get_num_verts(), scalar @$verts, 'get_num_verts' );

    cmp_ok( abs $poly->get_vert(0)->[0] - $verts->[0][0],
        '<', 1e-5, 'get_vert 0 x' );
    cmp_ok( abs $poly->get_vert(0)->[1] - $verts->[0][1],
        '<', 1e-5, 'get_vert 0 y' );

    cmp_ok( abs $poly->get_vert(1)->[0] - $verts->[1][0],
        '<', 1e-5, 'get_vert 1 x' );
    cmp_ok( abs $poly->get_vert(1)->[1] - $verts->[1][1],
        '<', 1e-5, 'get_vert 1 y' );

    cmp_ok( abs $poly->get_vert(2)->[0] - $verts->[2][0],
        '<', 1e-5, 'get_vert 2 x' );
    cmp_ok( abs $poly->get_vert(2)->[1] - $verts->[2][1],
        '<', 1e-5, 'get_vert 2 y' );

    eval {
        $poly->get_vert(3);
        fail('get_vert 3');
        1;
    } or do {
        pass('get_vert 3');
    };
}

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

