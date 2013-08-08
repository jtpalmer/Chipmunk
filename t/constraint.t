use strict;
use warnings;
use Test::More;
use Chipmunk::GearJoint;
use Chipmunk::GrooveJoint;
use Chipmunk::PinJoint;
use Chipmunk::PivotJoint;
use Chipmunk::RatchetJoint;
use Chipmunk::RotaryLimitJoint;
use Chipmunk::SlideJoint;
use Chipmunk::Body;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];

    #my $joint = Chipmunk::PinJoint->new( $a, $b, $anchr1, $anchr2 );

    ok( 1, 'TODO' );

    # TODO: activite_bodies, get_space, get_a, get_b, get_max_force,
    #       set_max_force, get_error_bias, set_error_bias, get_max_bias,
    #       set_max_bias, set_pre_solve_func, set_post_solve_func,
    #       get_user_data, set_user_data, get_impulse
}

done_testing();

