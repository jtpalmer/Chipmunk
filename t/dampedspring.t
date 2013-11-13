use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::DampedSpring;

{
    my $body_a = Chipmunk::Body->new( 1.0, 2.0 );
    my $body_b = Chipmunk::Body->new( 2.0, 3.0 );
    my ( $anchr1, $anchr2 ) = ( [ 4.0, 5.0 ], [ 6.0, 7.0 ] );
    my ( $rest_length, $stiffness, $damping ) = ( 1.0, 2.0, 3.0 );

    my $spring
        = Chipmunk::DampedSpring->new( $body_a, $body_b, $anchr1, $anchr2,
        $rest_length, $stiffness, $damping );

    isa_ok( $spring, 'Chipmunk::DampedSpring', 'new' );
}

done_testing();

