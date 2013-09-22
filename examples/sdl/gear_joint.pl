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
use Chipmunk::PivotJoint;
use Chipmunk::GearJoint;
use Math::Trig qw(pi);

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

my $space = Chipmunk::Space->new();
$space->set_gravity( [ 0, -10 ] );

my $gear1 = make_gear(
    x      => s2w( $width / 2 ),
    y      => s2w( $height / 2 ),
    radius => s2w(100),
    mass   => 100,
    color  => 0x224488ff,
    teeth  => 20,
);

my $gear2 = make_gear(
    x      => s2w( $width / 2 + 160 ),
    y      => s2w( $height / 2 ),
    radius => s2w(50),
    mass   => 100,
    color  => 0x448822ff,
    teeth  => 10,
);

my $joint = Chipmunk::GearJoint->new( $gear1->{body}, $gear2->{body}, 0,
    -( $gear2->{radius} / $gear1->{radius} ) );
$space->add_constraint($joint);

$gear1->{body}->set_ang_vel(0.5);

my $app = SDLx::App->new(
    title  => 'Gear Joint',
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
        $app->draw_rect( undef, undef );
        draw_gear($gear1);
        draw_gear($gear2);
        $app->update();
    }
);

$app->run();

exit;

sub make_gear {
    my %args = @_;
    my ( $x, $y, $r, $m, $c, $t ) = @args{qw( x y radius mass color teeth )};

    my $i = Chipmunk::moment_for_circle( $m, 0, $r, [ 0, 0 ] );

    my $body = Chipmunk::Body->new( $m, $i );
    $space->add_body($body);
    $body->set_pos( [ $x, $y ] );

    my $shape = Chipmunk::CircleShape->new( $body, $r, [ 0, 0 ] );
    $space->add_shape($shape);
    $shape->set_friction(1);

    # Create a static anchor for the gear.
    my $anchor_body = Chipmunk::Body->new_static();
    $anchor_body->set_pos( [ $x, $y ] );
    my $anchor_shape
        = Chipmunk::CircleShape->new( $anchor_body, s2w(1), [ 0, 0 ] );
    $space->add_static_shape($anchor_shape);
    $anchor_shape->set_sensor(1);

    # Pin the gear to the anchor.
    my $pin = Chipmunk::PivotJoint->new( $anchor_body, $body, [ $x, $y ] );
    $space->add_constraint($pin);

    return {
        color  => $c,
        body   => $body,
        shape  => $shape,
        teeth  => $t,
        radius => $r,
    };
}

sub draw_gear {
    my ($gear) = @_;

    my $center = w2s( $gear->{body}->get_pos() );
    my $r      = w2s( $gear->{shape}->get_radius() );
    my $color  = $gear->{color};

    $app->draw_circle_filled( $center, $r, $color );

    my $count = $gear->{teeth};

    for my $i ( 0 .. $count - 1 ) {
        my $angle = $i / $count * 2 * pi + $gear->{body}->get_angle();
        my $x     = $center->[0] + $r * cos($angle);
        my $y     = $center->[1] + $r * sin($angle);
        $app->draw_circle_filled( [ $x, $y ], $r / 10, $color );
    }
}

