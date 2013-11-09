#!perl
use strict;
use warnings;
use SDL;
use SDLx::App;
use Chipmunk;
use Chipmunk::Space;
use Chipmunk::CircleShape;
use Chipmunk::Body;
use Chipmunk::PinJoint;

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

my $time_step = 1.0 / 30.0;

# Circle size and mass.
my $radius = s2w(15);
my $mass   = 1;

my $space = Chipmunk::Space->new();
$space->set_gravity( [ 0, -10 ] );

my $moment = Chipmunk::moment_for_circle( $mass, 0, $radius, [ 0, 0 ] );

my $ball_body = Chipmunk::Body->new( $mass, $moment );
$space->add_body($ball_body);
my $offset = w2s( $radius * 2 );
my $ball_pos = s2w( [ $width / 2 + $offset, w2s( $radius * 4 ) ] );
$ball_body->set_pos($ball_pos);

my $ball_shape = Chipmunk::CircleShape->new( $ball_body, $radius, [ 0, 0 ] );
$space->add_shape($ball_shape);
$ball_shape->set_friction(0.7);

my $anchor_body = Chipmunk::Body->new_static();
my $anchor_pos = s2w( [ $width / 2, $height / 2 ] );
$anchor_body->set_pos($anchor_pos);
my $anchor_shape
    = Chipmunk::CircleShape->new( $anchor_body, $radius, [ 0, 0 ] );

my $joint
    = Chipmunk::PinJoint->new( $ball_body, $anchor_body, [ 0, 0 ], [ 0, 0 ] );

$space->add_constraint($joint);

my $app = SDLx::App->new(
    title  => 'Pendulum Example',
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

        # Clear surface.
        $app->draw_rect( undef, undef );

        my $r          = w2s($radius);
        my $ball_pos   = w2s( $ball_body->get_pos() );
        my $anchor_pos = w2s( $anchor_body->get_pos() );

        # Draw pendulum.
        $app->draw_line( $anchor_pos, $ball_pos, 0xccccccff );
        $app->draw_circle_filled( $anchor_pos, $r, 0x224488ff );
        $app->draw_circle_filled( $ball_pos,   $r, 0x448822ff );

        # Update surface.
        $app->update();
    }
);

$app->run();

