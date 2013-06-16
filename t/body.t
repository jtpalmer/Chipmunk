use strict;
use warnings;
use Test::More;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );

    my $body = Chipmunk::Body->new( $mass, $inertia );

    isa_ok( $body, 'Chipmunk::Body' );

    eval {
        $body->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

done_testing();

