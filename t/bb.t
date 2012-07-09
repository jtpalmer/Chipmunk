use strict;
use warnings;
use Test::More;
use Chipmunk::BB;

my ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
my $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );
ok( $bb, 'new' );
isa_ok( $bb, 'Chipmunk::BB' );

my ( $point, $radius ) = ( [ 10, 20 ], 5 );
my $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );
ok( $circle_bb, 'new_for_circle' );
isa_ok( $circle_bb, 'Chipmunk::BB' );

ok( $bb->intersects($circle_bb), 'intersects' );

ok( $bb->contains_bb($circle_bb), 'contains_bb' );

ok( $bb->contains_vect( [ 10, 20 ] ), 'contains_vect' );

done_testing();

