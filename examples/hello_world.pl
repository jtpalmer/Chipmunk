#!perl
use strict;
use warnings;
use Chipmunk;
use Chipmunk::Space;
use Chipmunk::SegmentShape;
use Chipmunk::CircleShape;
use Chipmunk::Body;

# Based on Hello Chipmunk (World) from
# http://chipmunk-physics.net/release/ChipmunkLatest-Docs/

my $space = Chipmunk::Space->new();

$space->set_gravity( [ 0, -100 ] );

my $ground = Chipmunk::SegmentShape->new(
    $space->static_body,
    [ -20, 5 ],
    [ 20,  -5 ], 0
);
$ground->set_friction(1);
$space->add_shape($ground);

my $radius = 5;
my $mass   = 1;

my $moment = Chipmunk::moment_for_circle( $mass, 0, $radius, [ 0, 0 ] );

my $ballBody = Chipmunk::Body->new( $mass, $moment );
$space->add_body($ballBody);
$ballBody->set_pos( [ 0, 15 ] );

my $ballShape = Chipmunk::CircleShape->new( $ballBody, $radius, [ 0, 0 ] );
$space->add_shape($ballShape);
$ballShape->set_friction(0.7);

my $time_step = 1.0 / 60.0;

for ( my $time = 0; $time < 2; $time += $time_step ) {
    my $pos = $ballBody->get_pos();
    my $vel = $ballBody->get_vel();
    printf( "Time is %5.2f. ballBody is at (%5.2f, %5.2f). "
            . "It's velocity is (%5.2f, %5.2f)\n",
        $time, $pos->[0], $pos->[1], $vel->[0], $vel->[1] );

    $space->step($time_step);
}

