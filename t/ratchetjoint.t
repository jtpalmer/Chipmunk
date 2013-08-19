use strict;
use warnings;
use Test::More;
use Chipmunk::RatchetJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my ( $phase, $ratchet ) = ( 3.3, 4.4 );

    my $joint = Chipmunk::RatchetJoint->new( $a, $b, $phase, $ratchet );

    isa_ok( $joint, 'Chipmunk::RatchetJoint', 'new' );

    # TODO: get_angle, set_angle
    #cmp_ok( abs $joint->get_angle() - $angle, '<', 1e-5, 'get_angle' );

    cmp_ok( abs $joint->get_phase() - $phase, '<', 1e-5, 'get_phase' );

    cmp_ok( abs $joint->get_ratchet() - $ratchet, '<', 1e-5, 'get_ratchet' );

    ( $phase, $ratchet ) = ( 5.5, 6.6 );

    $joint->set_phase($phase);
    cmp_ok( abs $joint->get_phase() - $phase, '<', 1e-5, 'set_phase' );

    $joint->set_ratchet($ratchet);
    cmp_ok( abs $joint->get_ratchet() - $ratchet, '<', 1e-5, 'set_ratchet' );
}

done_testing();

