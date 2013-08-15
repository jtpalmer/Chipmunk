use strict;
use warnings;
use Test::More;
use Chipmunk::PinJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];

    my $joint = Chipmunk::PinJoint->new( $a, $b, $anchr1, $anchr2 );

    isa_ok( $joint, 'Chipmunk::PinJoint', 'new' );

    cmp_ok( abs $joint->get_anchr1()->[0] - $anchr1->[0],
        '<', 1e-5, 'get_anchr1 x' );
    cmp_ok( abs $joint->get_anchr1()->[1] - $anchr1->[1],
        '<', 1e-5, 'get_anchr1 y' );

    cmp_ok( abs $joint->get_anchr2()->[0] - $anchr2->[0],
        '<', 1e-5, 'get_anchr2 x' );
    cmp_ok( abs $joint->get_anchr2()->[1] - $anchr2->[1],
        '<', 1e-5, 'get_anchr2 y' );

    ( $anchr1, $anchr2 ) = ( [ 7.7, 8.8 ], [ 9.9, 10.1 ] );

    $joint->set_anchr1($anchr1);

    cmp_ok( abs $joint->get_anchr1()->[0] - $anchr1->[0],
        '<', 1e-5, 'set_anchr1 x' );
    cmp_ok( abs $joint->get_anchr1()->[1] - $anchr1->[1],
        '<', 1e-5, 'set_anchr1 y' );

    $joint->set_anchr2($anchr2);

    cmp_ok( abs $joint->get_anchr2()->[0] - $anchr2->[0],
        '<', 1e-5, 'set_anchr2 x' );
    cmp_ok( abs $joint->get_anchr2()->[1] - $anchr2->[1],
        '<', 1e-5, 'set_anchr2 y' );

    # TODO: get_dist, set_dist
}

done_testing();

