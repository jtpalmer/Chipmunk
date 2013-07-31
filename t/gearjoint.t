use strict;
use warnings;
use Test::More;
use Chipmunk::GearJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my ( $phase, $ratio ) = ( 1.1, 2.2 );

    my $joint = Chipmunk::GearJoint->new( $a, $b, $phase, $ratio );

    isa_ok( $joint, 'Chipmunk::GearJoint', 'new' );
}

done_testing();

