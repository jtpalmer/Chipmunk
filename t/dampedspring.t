use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::DampedSpring;

{
    my $a = Chipmunk::Body->new( 1.0, 2.0 );
    my $b = Chipmunk::Body->new( 2.0, 3.0 );
    my ( $anchr1, $anchr2 ) = ( [ 4.0, 5.0 ], [ 6.0, 7.0 ] );
    my ( $restLength, $stiffness, $damping ) = ( 1.0, 2.0, 3.0 );

    my $spring
        = Chipmunk::DampedSpring->new( $a, $b, $anchr1, $anchr2, $restLength,
        $stiffness, $damping );

    isa_ok( $spring, 'Chipmunk::DampedSpring', 'new' );
}

done_testing();

