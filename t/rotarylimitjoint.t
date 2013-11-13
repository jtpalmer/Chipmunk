use strict;
use warnings;
use Test::More;
use Chipmunk::RotaryLimitJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my ( $min, $max ) = ( 3.3, 4.4 );

    my $joint
        = Chipmunk::RotaryLimitJoint->new( $body_a, $body_b, $min, $max );

    isa_ok( $joint, 'Chipmunk::RotaryLimitJoint', 'new' );

    cmp_ok( abs $joint->get_min() - $min, '<', 1e-5, 'get_min' );
    cmp_ok( abs $joint->get_max() - $max, '<', 1e-5, 'get_max' );

    ( $min, $max ) = ( 5.5, 6.6 );

    $joint->set_min($min);
    $joint->set_max($max);

    cmp_ok( abs $joint->get_min() - $min, '<', 1e-5, 'set_min' );
    cmp_ok( abs $joint->get_max() - $max, '<', 1e-5, 'set_max' );
}

done_testing();

