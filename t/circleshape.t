use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::CircleShape;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body = Chipmunk::Body->new( $mass, $inertia );

    my ( $radius, $offset ) = ( 3.0, [ 4.0, 5.0 ] );
    my $circle = Chipmunk::CircleShape->new( $body, $radius, $offset );

    isa_ok( $circle, 'Chipmunk::CircleShape', 'new' );

    cmp_ok( abs $circle->get_offset()->[0] - $offset->[0],
        '<', 1e-5, 'get_offset x' );
    cmp_ok( abs $circle->get_offset()->[1] - $offset->[1],
        '<', 1e-5, 'get_offset y' );

    cmp_ok( abs $circle->get_radius() - $radius, '<', 1e-5, 'get_radius' );

    eval {
        $circle->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

done_testing();

