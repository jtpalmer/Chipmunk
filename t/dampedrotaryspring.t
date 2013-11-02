use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::DampedRotarySpring;

{
    my $a = Chipmunk::Body->new( 1.0, 2.0 );
    my $b = Chipmunk::Body->new( 2.0, 3.0 );
    my ( $rest_angle, $stiffness, $damping ) = ( 0.0, 1.0, 2.0 );

    my $spring
        = Chipmunk::DampedRotarySpring->new( $a, $b, $rest_angle, $stiffness,
        $damping );

    isa_ok( $spring, 'Chipmunk::DampedRotarySpring', 'new' );
}

done_testing();

