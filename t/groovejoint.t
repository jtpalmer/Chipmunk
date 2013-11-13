use strict;
use warnings;
use Test::More;
use Chipmunk::GrooveJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my ( $groove_a, $groove_b ) = ( [ 3.3, 4.4 ], [ 5.5, 6.6 ] );

    my $anchr2 = [ 7.7, 8.8 ];

    my $joint
        = Chipmunk::GrooveJoint->new( $body_a, $body_b, $groove_a, $groove_b,
        $anchr2 );

    isa_ok( $joint, 'Chipmunk::GrooveJoint', 'new' );

    cmp_ok( abs $joint->get_groove_a()->[0] - $groove_a->[0],
        '<', 1e-5, 'get_groove_a x' );
    cmp_ok( abs $joint->get_groove_a()->[1] - $groove_a->[1],
        '<', 1e-5, 'get_groove_a y' );

    cmp_ok( abs $joint->get_groove_b()->[0] - $groove_b->[0],
        '<', 1e-5, 'get_groove_b x' );
    cmp_ok( abs $joint->get_groove_b()->[1] - $groove_b->[1],
        '<', 1e-5, 'get_groove_b y' );

    cmp_ok( abs $joint->get_anchr2()->[0] - $anchr2->[0],
        '<', 1e-5, 'get_anchr2 x' );
    cmp_ok( abs $joint->get_anchr2()->[1] - $anchr2->[1],
        '<', 1e-5, 'get_anchr2 y' );

    ( $groove_a, $groove_b ) = ( [ 9.9, 10.1 ], [ 11.11, 12.12 ] );

    $joint->set_groove_a($groove_a);
    $joint->set_groove_b($groove_b);

    cmp_ok( abs $joint->get_groove_a()->[0] - $groove_a->[0],
        '<', 1e-5, 'set_groove_a x' );
    cmp_ok( abs $joint->get_groove_a()->[1] - $groove_a->[1],
        '<', 1e-5, 'set_groove_a y' );

    cmp_ok( abs $joint->get_groove_b()->[0] - $groove_b->[0],
        '<', 1e-5, 'set_groove_b x' );
    cmp_ok( abs $joint->get_groove_b()->[1] - $groove_b->[1],
        '<', 1e-5, 'set_groove_b y' );

    $anchr2 = [ 7.7, 8.8 ];

    $joint->set_anchr2($anchr2);

    cmp_ok( abs $joint->get_anchr2()->[0] - $anchr2->[0],
        '<', 1e-5, 'set_anchr2 x' );
    cmp_ok( abs $joint->get_anchr2()->[1] - $anchr2->[1],
        '<', 1e-5, 'set_anchr2 y' );
}

done_testing();

