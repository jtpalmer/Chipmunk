use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::Space;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );

    my $body = Chipmunk::Body->new( $mass, $inertia );
    isa_ok( $body, 'Chipmunk::Body', 'new' );

    ok( !$body->is_static(), 'is_static (not static)' );

    ok( $body->is_rogue(), 'is_roque' );

    my $space = Chipmunk::Space->new();
    $space->add_body($body);

    ok( !$body->is_rogue(), 'is_roque (not rogue)' );

    $body->sleep();
    ok( $body->is_sleeping(), 'is_sleeping' );

    $body->activate();
    ok( !$body->is_sleeping(), 'is_sleeping (not sleeping)' );

    isa_ok( $body->get_space(), 'Chipmunk::Space', 'get_space' );

    my $pos = [ 5.0, 6.0 ];
    $body->set_pos($pos);
    cmp_ok( abs $body->get_pos()->[0] - $pos->[0], '<', 1e-5, 'get_pos x' );
    cmp_ok( abs $body->get_pos()->[1] - $pos->[1], '<', 1e-5, 'get_pos y' );

    my $angle = 1.1;
    $body->set_angle($angle);
    cmp_ok( abs $body->get_angle() - $angle, '<', 1e-5, 'get_angle' );

    eval {
        $body->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

{
    my $body = Chipmunk::Body->new_static();
    isa_ok( $body, 'Chipmunk::Body', 'new_static' );

    ok( $body->is_static(), 'is_static' );

    eval {
        $body->free();
        pass('free (static)');
        1;
    } or do {
        fail('free (static)');
    };
}

done_testing();

