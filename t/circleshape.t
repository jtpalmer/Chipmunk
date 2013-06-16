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

    ok( $circle, 'new' );
    isa_ok( $circle, 'Chipmunk::CircleShape' );

    my $friction = 3.0;

    $circle->set_friction($friction);

    cmp_ok( abs $circle->get_friction() - $friction,
        '<', 1e-5, 'get_friction' );

    eval {
        $circle->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

done_testing();

