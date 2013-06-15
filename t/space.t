use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

my $gravity = [ 1, 2 ];

{
    my $space = Chipmunk::Space->new();

    isa_ok( $space, 'Chipmunk::Space' );

    is( $space->is_locked(), 0, 'is_locked' );

    $space->set_gravity($gravity);

    cmp_ok( abs $space->get_gravity()->[0] - $gravity->[0],
        '<', 1e-5, 'get_gravity x' );
    cmp_ok( abs $space->get_gravity()->[1] - $gravity->[1],
        '<', 1e-5, 'get_gravity y' );

    eval {
        $space->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

{
    my $space = Chipmunk::Space->new();
    $space->set_gravity($gravity);

    my $count = 0;
    my $key   = 'key';
    my $data  = 'data';

    my $callback = sub {
        my ( $s, $k, $d ) = @_;

        $count++;

        isa_ok( $s, 'Chipmunk::Space', 'space in callback' );
        is( $k, $key,  'key in callback' );
        is( $d, $data, 'data in callback' );
    };

    $space->add_post_step_callback( $callback, $key, $data );
    $space->step(0.01);

    is( $count, 1, 'post step callback was called once' );
}

done_testing();

