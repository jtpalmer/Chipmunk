#!perl
use strict;
use warnings;
use SDL;
use SDLx::App;
use Chipmunk;
use Chipmunk::Space;
use Chipmunk::SegmentShape;
use Chipmunk::CircleShape;
use Chipmunk::Body;

# Based on Hello Chipmunk (World) from
# http://chipmunk-physics.net/release/ChipmunkLatest-Docs/

# Window dimensions.
my ( $width, $height ) = ( 640, 480 );

# Coordinate conversion factor (pixels per meter).
my $ppm = 10;

# Inverse conversion factor (meters per pixel).
my $mpp = 1.0 / $ppm;

# World to screen.
sub w2s {
    return $_[0] * $ppm unless ref $_[0];

    return [ $_[0][0] * $ppm, $height - $_[0][1] * $ppm ];
}

# Screen to world.
sub s2w {
    return $_[0] * $mpp unless ref $_[0];

    return [ $_[0][0] * $mpp, ( $height - $_[0][1] ) * $mpp ];
}

# Ground screen coordinates.
my ( $ground_pos0, $ground_pos1 )
    = ( [ 0, $height ], [ $width, $height * 0.9 ] );

my $time_step = 1.0 / 30.0;

# Circle size and mass.
my $radius = s2w(15);
my $mass   = 1;

my $space = Chipmunk::Space->new();
$space->set_gravity( [ 0, -10 ] );

my $ground = Chipmunk::SegmentShape->new( $space->static_body,
    s2w($ground_pos0), s2w($ground_pos1), 0 );
$ground->set_friction(1);

$space->add_shape($ground);

my $moment = Chipmunk::moment_for_circle( $mass, 0, $radius, [ 0, 0 ] );

my $ball_body = Chipmunk::Body->new( $mass, $moment );
$space->add_body($ball_body);
$ball_body->set_pos( s2w( [ $width / 2, 0 ] ) );

my $ball_shape = Chipmunk::CircleShape->new( $ball_body, $radius, [ 0, 0 ] );
$space->add_shape($ball_shape);
$ball_shape->set_friction(0.7);

my $app = SDLx::App->new(
    title  => 'Hello World',
    width  => $width,
    height => $height,
    dt     => $time_step,
    delay  => $time_step / 1.1,
    eoq    => 1,
);

$app->add_move_handler(
    sub {
        $space->step($time_step);
    }
);

$app->add_show_handler(
    sub {
        my $pos = $ball_body->get_pos();

        $app->draw_rect( undef, undef );

        $app->draw_line( $ground_pos0, $ground_pos1, 0xffffffff );

        $app->draw_circle_filled( w2s($pos), w2s($radius), 0x448822ff );

        $app->update();
    }
);

$app->run();

