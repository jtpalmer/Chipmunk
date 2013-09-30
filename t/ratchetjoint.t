use strict;
use warnings;
use Test::More;
use Chipmunk::RatchetJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my ( $angle_a, $angle_b ) = ( 5.5, 6.1 );
    $a->set_angle($angle_a);
    $b->set_angle($angle_b);

    my ( $phase, $ratchet ) = ( 3.3, 4.4 );
    my $joint = Chipmunk::RatchetJoint->new( $a, $b, $phase, $ratchet );

    isa_ok( $joint, 'Chipmunk::RatchetJoint', 'new' );

    my $angle = $b->get_angle() - $a->get_angle();
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

