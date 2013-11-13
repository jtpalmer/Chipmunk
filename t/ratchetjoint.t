use strict;
use warnings;
use Test::More;
use Chipmunk::RatchetJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my ( $angle_a, $angle_b ) = ( 5.5, 6.1 );
    $body_a->set_angle($angle_a);
    $body_b->set_angle($angle_b);

    my ( $phase, $ratchet ) = ( 3.3, 4.4 );
    my $joint
        = Chipmunk::RatchetJoint->new( $body_a, $body_b, $phase, $ratchet );

    isa_ok( $joint, 'Chipmunk::RatchetJoint', 'new' );

    my $angle = $body_b->get_angle() - $body_a->get_angle();
    cmp_ok( abs $joint->get_angle() - $angle, '<', 1e-5, 'get_angle' );

    $angle = 1;
    $joint->set_angle($angle);
    cmp_ok( abs $joint->get_angle() - $angle, '<', 1e-5, 'set_angle' );

    cmp_ok( abs $joint->get_phase() - $phase, '<', 1e-5, 'get_phase' );

    cmp_ok( abs $joint->get_ratchet() - $ratchet, '<', 1e-5, 'get_ratchet' );

    ( $phase, $ratchet ) = ( 5.5, 6.6 );

    $joint->set_phase($phase);
    cmp_ok( abs $joint->get_phase() - $phase, '<', 1e-5, 'set_phase' );

    $joint->set_ratchet($ratchet);
    cmp_ok( abs $joint->get_ratchet() - $ratchet, '<', 1e-5, 'set_ratchet' );
}

done_testing();

