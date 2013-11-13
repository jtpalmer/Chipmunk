use strict;
use warnings;
use Test::More;
use Chipmunk::PinJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];

    my $joint = Chipmunk::PinJoint->new( $body_a, $body_b, $anchr1, $anchr2 );

    isa_ok( $joint, 'Chipmunk::PinJoint', 'new' );

    cmp_ok( abs $joint->get_anchr1()->[0] - $anchr1->[0],
        '<', 1e-5, 'get_anchr1 x' );
    cmp_ok( abs $joint->get_anchr1()->[1] - $anchr1->[1],
        '<', 1e-5, 'get_anchr1 y' );

    cmp_ok( abs $joint->get_anchr2()->[0] - $anchr2->[0],
        '<', 1e-5, 'get_anchr2 x' );
    cmp_ok( abs $joint->get_anchr2()->[1] - $anchr2->[1],
        '<', 1e-5, 'get_anchr2 y' );

    my ( $dx, $dy )
        = ( $anchr1->[0] - $anchr2->[0], $anchr1->[1] - $anchr2->[1] );
    cmp_ok( abs $joint->get_dist() - sqrt( $dx * $dx + $dy * $dy ),
        '<', 1e-5, 'get_dist' );

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

    my $dist = 7.7;
    $joint->set_dist($dist);
    cmp_ok( abs $joint->get_dist() - $dist, '<', 1e-5, 'set_dist' );
}

done_testing();

