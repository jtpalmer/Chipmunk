use strict;
use warnings;
use Test::More;
use Chipmunk::SimpleMotor;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $body_a = Chipmunk::Body->new( $mass, $inertia );
    my $body_b = Chipmunk::Body->new( $mass, $inertia );

    my $rate = 3.3;

    my $motor = Chipmunk::SimpleMotor->new( $body_a, $body_b, $rate );

    cmp_ok( abs $motor->get_rate() - $rate, '<', 1e-5, 'get_rate' );

    $rate = 4.4;
    $motor->set_rate($rate);
    cmp_ok( abs $motor->get_rate() - $rate, '<', 1e-5, 'set_rate' );
}

done_testing();

