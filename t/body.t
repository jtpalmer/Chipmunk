use strict;
use warnings;
use Test::More;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );

    my $body = Chipmunk::Body->new( $mass, $inertia );

    isa_ok( $body, 'Chipmunk::Body' );

    my $pos = [ 5.0, 6.0 ];
    $body->set_pos($pos);
    cmp_ok( abs $body->get_pos()->[0] - $pos->[0], '<', 1e-5, 'get_pos x' );
    cmp_ok( abs $body->get_pos()->[1] - $pos->[1], '<', 1e-5, 'get_pos y' );

    eval {
        $body->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

done_testing();

