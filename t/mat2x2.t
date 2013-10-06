use strict;
use warnings;
use Test::More;
use Chipmunk::Mat2x2;

{
    my ( $a, $b, $c, $d ) = ( 1.1, 2.2, 3.3, 4.4 );
    my $matrix = Chipmunk::Mat2x2->new( $a, $b, $c, $d );
    isa_ok( $matrix, 'Chipmunk::Mat2x2', 'new' );

    cmp_ok( abs $matrix->[0] - $a, '<', 1e-5, '->[0]' );
    cmp_ok( abs $matrix->[1] - $b, '<', 1e-5, '->[1]' );
    cmp_ok( abs $matrix->[2] - $c, '<', 1e-5, '->[2]' );
    cmp_ok( abs $matrix->[3] - $d, '<', 1e-5, '->[3]' );

    my $v = [ 5.5, 6.6 ];
    my $t = $matrix->transform($v);
    cmp_ok( abs $t->[0] - ( $v->[0] * $a + $v->[1] * $b ),
        '<', 1e-5, 'transform x' );
    cmp_ok( abs $t->[1] - ( $v->[0] * $c + $v->[1] * $d ),
        '<', 1e-5, 'transform y' );
}

done_testing();

