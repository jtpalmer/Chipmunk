use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

my $gravity = [ 1, 2 ];

{
    my $space = Chipmunk::Space->new();

    isa_ok( $space, 'Chipmunk::Space', 'new' );

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

done_testing();

