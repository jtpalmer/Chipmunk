use strict;
use warnings;
use Test::More;
use Chipmunk::Space;

{
    my $space = Chipmunk::Space->new();

    isa_ok( $space, 'Chipmunk::Space', 'new' );

    my $iterations = 11;
    $space->set_iterations($iterations);
    is( $space->get_iterations(), $iterations, 'get_iterations' );

    my $gravity = [ 1, 2 ];
    $space->set_gravity($gravity);
    cmp_ok( abs $space->get_gravity()->[0] - $gravity->[0],
        '<', 1e-5, 'get_gravity x' );
    cmp_ok( abs $space->get_gravity()->[1] - $gravity->[1],
        '<', 1e-5, 'get_gravity y' );

    my $damping = 2.2;
    $space->set_damping($damping);
    cmp_ok( abs $space->get_damping() - $damping, '<', 1e-5, 'get_damping' );

    my $idle_speed_threshold = 0.01;
    $space->set_idle_speed_threshold($idle_speed_threshold);
    cmp_ok( abs $space->get_idle_speed_threshold() - $idle_speed_threshold,
        '<', 1e-5, 'get_idle_speed_threshold' );

    my $sleep_time_threshold = 0.005;
    $space->set_sleep_time_threshold($sleep_time_threshold);
    cmp_ok( abs $space->get_sleep_time_threshold() - $sleep_time_threshold,
        '<', 1e-5, 'get_sleep_time_threshold' );

    my $collision_slop = 0.5;
    $space->set_collision_slop($collision_slop);
    cmp_ok( abs $space->get_collision_slop() - $collision_slop,
        '<', 1e-5, 'get_collision_slop' );

    # TODO: get_collision_slop, set_collision_slop,
    #       get_collision_bias, set_collision_bias,
    #       get_collision_persistence, set_collision_persistence,
    #       get_enable_contact_graph, set_enable_contact_graph,
    #       get_user_data, set_user_data, get_static_body,
    #       get_current_time_step

    is( $space->is_locked(), 0, 'is_locked' );

    # TODO: set_default_collision_handler, add_collision_handler,
    #       remove_collision_handler, add_shape, add_static_shape,
    #       add_body, add_constraint, remove_shape, remove_static_shape,
    #       remove_body, remove_constraint, contains_shape,
    #       contains_body, contains_constraint, convert_body_to_static,
    #       convert_body_to_dynamic, add_post_step_callback,
    #       point_query, point_query_first, nearest_point_query,
    #       nearest_point_query_nearest, segment_query,
    #       segment_query_first, bb_query, shape_query,
    #       activate_shapes_touching_shape, each_body, each_shape,
    #       each_constraint, reindex_static, reindex_shape,
    #       reindex_shapes_for_body, use_spatial_hash, step
}

done_testing();

