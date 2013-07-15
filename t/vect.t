use strict;
use warnings;
use Test::More;
use Chipmunk::Vect qw(:all);

# TODO: cpvslerp

{
    my $v = [ 1.1, 2.2 ];
    my $str = cpvstr($v);
    my ( $x, $y ) = $str =~ m/^\( ([^,]*) , ([^,]*) \)$/msx;
    cmp_ok( abs $x - $v->[0], '<', 1e-2, 'cpstr x' );
    cmp_ok( abs $y - $v->[1], '<', 1e-2, 'cpstr y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $sum = cpvadd( $v1, $v2 );
    cmp_ok( abs $sum->[0] - ( $v1->[0] + $v2->[0] ), '<', 1e-5, 'cpvadd x' );
    cmp_ok( abs $sum->[1] - ( $v1->[1] + $v2->[1] ), '<', 1e-5, 'cpvadd y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $diff = cpvsub( $v1, $v2 );
    cmp_ok( abs $diff->[0] - ( $v1->[0] - $v2->[0] ), '<', 1e-5, 'cpvsub x' );
    cmp_ok( abs $diff->[1] - ( $v1->[1] - $v2->[1] ), '<', 1e-5, 'cpvsub y' );
}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = cpvneg($v1);
    cmp_ok( abs $v2->[0] - ( -$v1->[0] ), '<', 1e-5, 'cpvneg x' );
    cmp_ok( abs $v2->[1] - ( -$v1->[1] ), '<', 1e-5, 'cpvneg y' );

}

{
    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];
    my $t  = 0.5;

    my $lerp = cpvlerp( $v1, $v2, $t );
    cmp_ok( abs $lerp->[0] - ( $t * $v1->[0] + ( 1 - $t ) * $v2->[0] ),
        '<', 1e-5, 'cpvlerp x' );
    cmp_ok( abs $lerp->[1] - ( $t * $v1->[1] + ( 1 - $t ) * $v2->[1] ),
        '<', 1e-5, 'cpvlerp y' );
}


done_testing();

