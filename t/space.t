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

    cmp_ok( abs $space->get_gravity()->[0] - $gravity->[0],
        '<', 1e-5, 'get_gravity x' );
    cmp_ok( abs $space->get_gravity()->[1] - $gravity->[1],
        '<', 1e-5, 'get_gravity y' );
}

pass('DESTROY');

done_testing();

