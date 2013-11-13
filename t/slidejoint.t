use strict;
use warnings;
use Test::More;
use Chipmunk::SlideJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];

    my ( $min, $max ) = ( 0.7, 18.8 );

    my $joint = Chipmunk::SlideJoint->new( $body_a, $body_b, $anchr1, $anchr2,
        $min, $max );

    isa_ok( $joint, 'Chipmunk::SlideJoint', 'new' );

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

    cmp_ok( abs $joint->get_min() - $min, '<', 1e-5, 'get_min' );
    cmp_ok( abs $joint->get_max() - $max, '<', 1e-5, 'get_max' );

    ( $min, $max ) = ( 9.9, 21.21 );

    $joint->set_min($min);

    cmp_ok( abs $joint->get_min() - $min, '<', 1e-5, 'set_min' );

    $joint->set_max($max);

    cmp_ok( abs $joint->get_max() - $max, '<', 1e-5, 'set_max' );
}

done_testing();

