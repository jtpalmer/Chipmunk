#!perl
use strict;
use warnings;
use Chipmunk;
use Chipmunk::Math;
use Chipmunk::Vect qw(cpvstr);
use Chipmunk::Space;
use Chipmunk::SegmentShape;
use Chipmunk::CircleShape;
use Chipmunk::Body;

# Based on Hello Chipmunk (World) from
# http://chipmunk-physics.net/release/ChipmunkLatest-Docs/

my $space = Chipmunk::Space->new();

$space->set_gravity( [ 0, -100 ] );

my $ground = Chipmunk::SegmentShape->new(
    $space->get_static_body(),
    [ -20, 5 ],
    [ 20,  -5 ], 0
);
$ground->set_friction(1);
$space->add_shape($ground);

my $radius = 5;
my $mass   = 1;

my $moment = Chipmunk::Math::moment_for_circle( $mass, 0, $radius, [ 0, 0 ] );

my $ball_body = Chipmunk::Body->new( $mass, $moment );
$space->add_body($ball_body);
$ball_body->set_pos( [ 0, 15 ] );

my $ball_shape = Chipmunk::CircleShape->new( $ball_body, $radius, [ 0, 0 ] );
$space->add_shape($ball_shape);
$ball_shape->set_friction(0.7);

my $time_step = 1.0 / 60.0;

for ( my $time = 0; $time < 2; $time += $time_step ) {
    my $pos = $ball_body->get_pos();
    my $vel = $ball_body->get_vel();

    printf( "Time is %5.2f. ball_body is at %s. It's velocity is %s\n",
        $time, cpvstr($pos), cpvstr($vel) );

    $space->step($time_step);
}

