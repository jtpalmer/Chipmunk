#!perl
use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::PolyShape;

my ( $mass, $inertia ) = ( 1.0, 2.0 );
my $body = Chipmunk::Body->new( $mass, $inertia );

my $poly
    = Chipmunk::PolyShape->new( $body, [ [ 0, 0 ], [ 1, 0 ], [ 1, 1 ] ] );

isa_ok( $poly, 'Chipmunk::PolyShape' );

my $gravity = [ 1, 2 ];

done_testing();

