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

# Translate from world coordinates to screen coordinates.
sub translate_coord {
    my ($pos) = @_;
    my ( $x, $y ) = @$pos;
    return [ $x, $height - $y ];
}

my ( $ground_pos0, $ground_pos1 ) = ( [ 0, 0 ], [ $width, $height / 10 ] );

my $time_step = 1.0 / 30.0;

# Circle size and mass.
my $radius = 5;
my $mass   = 1;

my $space = Chipmunk::Space->new();
$space->set_gravity( [ 0, -100 ] );

my $ground = Chipmunk::SegmentShape->new( $space->static_body, $ground_pos0,
    $ground_pos1, 0 );
$ground->set_friction(1);

$space->add_shape($ground);

my $moment = Chipmunk::moment_for_circle( $mass, 0, $radius, [ 0, 0 ] );

my $ball_body = Chipmunk::Body->new( $mass, $moment );
$space->add_body($ball_body);
$ball_body->set_pos( [ $width / 2, $height ] );

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

        $app->draw_line( translate_coord($ground_pos0),
            translate_coord($ground_pos1), 0xffffffff );

        $app->draw_circle_filled( translate_coord($pos),
            $radius, 0xffffffff );

        $app->update();
    }
);

$app->run();

