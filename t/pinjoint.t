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

    # TODO: get_anchr1, set_anchr1, get_anchr2, set_anchr2, get_dist,
    #       set_dist
}

done_testing();

