use strict;
use warnings;
use Test::More;
use Chipmunk::RatchetJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    ok( 1, 'TODO' );

    # TODO: new, get_angle, set_angle, get_phase, set_phase, get_ratchet,
    #       set_ratchet
}

done_testing();

