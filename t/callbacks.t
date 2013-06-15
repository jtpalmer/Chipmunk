use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

my $space = Chipmunk::Space->new();
$space->set_gravity( [ 0, -10 ] );

my $count = 0;

{
    my $key  = 'key';
    my $data = 'data';

    my $callback = sub {
        my ( $s, $k, $d ) = @_;

        $count++;

        isa_ok( $s, 'Chipmunk::Space', 'space in callback' );
        is( $k, $key,  'key in callback' );
        is( $d, $data, 'data in callback' );
    };

    $space->add_post_step_callback( $callback, $key, $data );
}

$space->step(0.01);

is( $count, 1, 'post step callback was called once' );

{
    my $data = ['data'];

    my $callback = sub {
        my ( $s, $k, $d ) = @_;

        $count++;

        is_deeply( $d, $data, 'data in callback' );
    };

    $space->add_post_step_callback( $callback, 'key', $data );
}

$space->step(0.01);

is( $count, 2, 'post step callback was called twice' );

done_testing();

