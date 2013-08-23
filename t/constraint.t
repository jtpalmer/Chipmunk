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

my @constraints;

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];
    my ( $phase, $ratio ) = ( 1.1, 2.2 );
    my $joint = Chipmunk::GearJoint->new( $a, $b, $phase, $ratio );
    push @constraints, { type => 'gearjoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my ( $groove_a, $groove_b ) = ( [ 3.3, 4.4 ], [ 5.5, 6.6 ] );
    my $anchr2 = [ 7.7, 8.8 ];
    my $joint
        = Chipmunk::GrooveJoint->new( $a, $b, $groove_a, $groove_b, $anchr2 );
    push @constraints, { type => 'groovejoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];
    my $joint = Chipmunk::PinJoint->new( $a, $b, $anchr1, $anchr2 );
    push @constraints, { type => 'pinjoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my $pivot = [ 3.3, 4.4 ];
    my $joint = Chipmunk::PivotJoint->new( $a, $b, $pivot );
    push @constraints, { type => 'pivotjoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my ( $phase, $ratchet ) = ( 3.3, 4.4 );
    my $joint = Chipmunk::RatchetJoint->new( $a, $b, $phase, $ratchet );
    push @constraints, { type => 'ratchetjoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my ( $min, $max ) = ( 3.3, 4.4 );
    my $joint = Chipmunk::RotaryLimitJoint->new( $a, $b, $min, $max );
    push @constraints, { type => 'rotarylimitjoint', constraint => $joint };
}

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );
    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];
    my ( $min, $max ) = ( 0.7, 18.8 );
    my $joint
        = Chipmunk::SlideJoint->new( $a, $b, $anchr1, $anchr2, $min, $max );
    push @constraints, { type => 'slidejoint', constraint => $joint };
}

for (@constraints) {
    my ( $type, $constraint ) = @$_{qw( type constraint )};

    isa_ok( $constraint, 'Chipmunk::Constraint', "new ($type)" );

    # TODO: activite_bodies, get_space, get_a, get_b, get_max_force,
    #       set_max_force, get_error_bias, set_error_bias, get_max_bias,
    #       set_max_bias, set_pre_solve_func, set_post_solve_func,
    #       get_user_data, set_user_data, get_impulse
}

done_testing();

