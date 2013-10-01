use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::CircleShape;
use Chipmunk::PolyShape;
use Chipmunk::SegmentShape;

my ( $mass, $inertia ) = ( 1.0, 2.0 );

my @shapes;

{
    my $body = Chipmunk::Body->new( $mass, $inertia );
    my ( $radius, $offset ) = ( 3.0, [ 4.0, 5.0 ] );
    my $circle = Chipmunk::CircleShape->new( $body, $radius, $offset );
    push @shapes, { type => 'circle', shape => $circle };
}

{
    my $body = Chipmunk::Body->new( $mass, $inertia );
    my ( $point_a, $point_b, $radius ) = ( [ 3.0, 4.0 ], [ 5.0, 6.0 ], 7.0 );
    my $segment
        = Chipmunk::SegmentShape->new( $body, $point_a, $point_b, $radius );
    push @shapes, { type => 'segment', shape => $segment };
}

{
    my $body = Chipmunk::Body->new( $mass, $inertia );
    my $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];
    my $poly = Chipmunk::PolyShape->new( $body, $verts );
    push @shapes, { type => 'poly', shape => $poly };
}

for (@shapes) {
    my ( $type, $shape ) = @$_{qw( type shape )};

    isa_ok( $shape, 'Chipmunk::Shape', "new ($type)" );

    {
        my $bb = $shape->cache_bb();
        ok( $bb, "cache_bb ($type)" );
        isa_ok( $bb, 'Chipmunk::BB', "cache_bb ($type)" );

        my $pos = [ 1.0, 2.0 ];
        my $rot = [ 1.0, 0.0 ];
        my $bb2 = $shape->update( $pos, $rot );
        cmp_ok( abs $bb2->[0] - $bb->[0] - $pos->[0],
            '<', 1e-5, "update left ($type)" );
        cmp_ok( abs $bb2->[1] - $bb->[1] - $pos->[1],
            '<', 1e-5, "update bottom ($type)" );
        cmp_ok( abs $bb2->[2] - $bb->[2] - $pos->[0],
            '<', 1e-5, "update right ($type)" );
        cmp_ok( abs $bb2->[3] - $bb->[3] - $pos->[1],
            '<', 1e-5, "update top ($type)" );
    }

    {
        my $bb = $shape->get_bb();
        ok( $bb, "get_bb ($type)" );
        isa_ok( $bb, 'Chipmunk::BB', "get_bb ($type)" );
    }

    # TODO: point_query, get_space, get_body, set_body, get_elasticity,
    #       set_elasticity

    $shape->set_sensor(1);
    ok( $shape->get_sensor(), "get/set_sensor true ($type)" );
    $shape->set_sensor(0);
    ok( !$shape->get_sensor(), "get/set_sensor false ($type)" );

    my $friction = 3.0;
    $shape->set_friction($friction);
    cmp_ok( abs $shape->get_friction() - $friction,
        '<', 1e-5, "get_friction ($type)" );

    my $surface_velocity = [ 4.4, 5.5 ];
    $shape->set_surface_velocity($surface_velocity);
    cmp_ok( abs $shape->get_surface_velocity()->[0] - $surface_velocity->[0],
        '<', 1e-5, "get_surface_velocity x ($type)" );
    cmp_ok( abs $shape->get_surface_velocity()->[1] - $surface_velocity->[1],
        '<', 1e-5, "get_surface_velocity y ($type)" );

    # TODO: set_user_data, get_user_data

    my $collision_type = 7;
    $shape->set_collision_type($collision_type);
    is( $shape->get_collision_type(),
        $collision_type, "get_collision_type ($type)" );

    my $group = 8;
    $shape->set_group($group);
    is( $shape->get_group(), $group, "get_group ($type)" );

    my $layers = 3;
    $shape->set_layers($layers);
    is( $shape->get_layers(), $layers, "get_layers ($type)" );

    eval {
        $shape->free();
        pass("free ($type)");
        1;
    } or do {
        fail("free ($type)");
    };
}

done_testing();

