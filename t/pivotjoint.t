use strict;
use warnings;
use Test::More;
use Chipmunk::PivotJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    ok( 1, 'TODO' );
}

done_testing();

