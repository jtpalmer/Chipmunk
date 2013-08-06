use strict;
use warnings;
use Test::More;
use Chipmunk::GrooveJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my ( $groove_a, $groove_b ) = ( [ 3.3, 4.4 ], [ 5.5, 6.6 ] );

    my $anchr2 = [ 7.7, 8.8 ];

    my $joint
        = Chipmunk::GrooveJoint->new( $a, $b, $groove_a, $groove_b, $anchr2 );

    isa_ok( $joint, 'Chipmunk::GrooveJoint', 'new' );

    # TODO: get_groove_a, set_groove_a, get_groove_b, set_groove_b,
    #       get_anchr2, set_anchr2
}

done_testing();

