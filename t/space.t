use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

my $space = Chipmunk::Space->new();

isa_ok( $space, 'Chipmunk::Space' );

is( $space->is_locked(), 0, 'is_locked' );

my $gravity = [ 1, 2 ];

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

$space = Chipmunk::Space->new();
$space->set_gravity($gravity);

my $called = 0;
my $key    = 'key';
my $data   = 'data';

$space->add_post_step_callback(
    sub {
        my ( $s, $k, $d ) = @_;

        $called = 1;

        isa_ok( $s, 'Chipmunk::Space', 'space in callback' );
        is( $k, $key,  'key in callback' );
        is( $d, $data, 'data in callback' );
    },
    $key,
    $data
);

$space->step(0.01);

ok( $called, 'post step callback was called' );

done_testing();

