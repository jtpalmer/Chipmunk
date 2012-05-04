#!perl
use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

{
    my $space = Chipmunk::Space->new();

    isa_ok( $space, 'Chipmunk::Space' );

    is( $space->is_locked(), 0, 'is_locked' );

    my $gravity = [ 1, 2 ];

    $space->set_gravity($gravity);

    is_deeply( $space->get_gravity(), $gravity, 'get_gravity' );
}

pass('DESTROY');

done_testing();

