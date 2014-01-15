package Chipmunk::Space;

# ABSTRACT: Basic unit of simulation in Chipmunk

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Space', $Chipmunk::Space::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk::Space;
    my $space = Chipmunk::Space->new();
    $space->set_gravity([ 0, -10 ]);

=head1 DESCRIPTION

A C<Chipmunk::Space> is the basic unit of simulation in Chipmunk
Physics.

=head1 METHODS

=head2 new

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_iterations

=over 4

=item Arguments:

=item Return Value:

=back

Iterations allow you to control the accuracy of the solver. Defaults to 10.

=head2 set_iterations

=over 4

=item Arguments:

=item Return Value:

=back

Iterations allow you to control the accuracy of the solver. Defaults to 10.

=head2 get_gravity

=over 4

=item Arguments:

=item Return Value:

=back

Global gravity applied to the space. Defaults to cpvzero. Can be
overridden on a per body basis by writing custom integration functions.

=head2 set_gravity

=over 4

=item Arguments:

=item Return Value:

=back

Global gravity applied to the space. Defaults to cpvzero. Can be
overridden on a per body basis by writing custom integration functions.

=head2 get_damping

=over 4

=item Arguments:

=item Return Value:

=back

Amount of simple damping to apply to the space. A value of 0.9 means
that each body will lose 10% of it's velocity per second. Defaults to 1.
Like gravity can be overridden on a per body basis.

=head2 set_damping

=over 4

=item Arguments:

=item Return Value:

=back

Amount of simple damping to apply to the space. A value of 0.9 means
that each body will lose 10% of it's velocity per second. Defaults to 1.
Like gravity can be overridden on a per body basis.

=head2 get_idle_speed_threshold

=over 4

=item Arguments:

=item Return Value:

=back

Speed threshold for a body to be considered idle. The default value of
0 means to let the space guess a good threshold based on gravity.

=head2 set_idle_speed_threshold

=over 4

=item Arguments:

=item Return Value:

=back

Speed threshold for a body to be considered idle. The default value of
0 means to let the space guess a good threshold based on gravity.

=head2 get_sleep_time_threshold

=over 4

=item Arguments:

=item Return Value:

=back

Time a group of bodies must remain idle in order to fall asleep. The
default value of INFINITY disables the sleeping feature.

=head2 set_sleep_time_threshold

=over 4

=item Arguments:

=item Return Value:

=back

Time a group of bodies must remain idle in order to fall asleep. The
default value of INFINITY disables the sleeping feature.

=head2 get_collision_slop

=over 4

=item Arguments:

=item Return Value:

=back

Amount of overlap between shapes that is allowed. It's encouraged to set
this as high as you can without noticable overlapping as it improves the
stability. It defaults to 0.1.

=head2 set_collision_slop

=over 4

=item Arguments:

=item Return Value:

=back

Amount of overlap between shapes that is allowed. It's encouraged to set
this as high as you can without noticable overlapping as it improves the
stability. It defaults to 0.1.

=head2 get_collision_bias

=over 4

=item Arguments:

=item Return Value:

=back

Chipmunk allows fast moving objects to overlap, then fixes the overlap
over time. Overlapping objects are unavoidable even if swept collisions
are supported, and this is an efficient and stable way to deal with
overlapping objects. The bias value controls what percentage of overlap
remains unfixed after a second and defaults to ~0.2%. Valid values are
in the range from 0 to 1, but using 0 is not recommended for stability
reasons. The default value is calculated as cpfpow(1.0f - 0.1f, 60.0f)
meaning that Chipmunk attempts to correct 10% of error ever 1/60th of a
second.

B<NOTE>: Very very few games will need to change this value.

=head2 set_collision_bias

=over 4

=item Arguments:

=item Return Value:

=back

Chipmunk allows fast moving objects to overlap, then fixes the overlap
over time. Overlapping objects are unavoidable even if swept collisions
are supported, and this is an efficient and stable way to deal with
overlapping objects. The bias value controls what percentage of overlap
remains unfixed after a second and defaults to ~0.2%. Valid values are
in the range from 0 to 1, but using 0 is not recommended for stability
reasons. The default value is calculated as cpfpow(1.0f - 0.1f, 60.0f)
meaning that Chipmunk attempts to correct 10% of error ever 1/60th of a
second.

B<NOTE>: Very very few games will need to change this value.

=head2 get_collision_persistence

=over 4

=item Arguments:

=item Return Value:

=back

The number of frames the space keeps collision solutions around for.
Helps prevent jittering contacts from getting worse. This defaults to 3
and very very very few games will need to change this value.

=head2 set_collision_persistence

=over 4

=item Arguments:

=item Return Value:

=back

The number of frames the space keeps collision solutions around for.
Helps prevent jittering contacts from getting worse. This defaults to 3
and very very very few games will need to change this value.

=head2 get_enable_contact_graph

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_enable_contact_graph

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_user_data

=over 4

=item Arguments:

=item Return Value:

=back

A user definable data pointer. It’s useful to point this at the
gamestate object or scene management object that owns the space.

=head2 set_user_data

=over 4

=item Arguments:

=item Return Value:

=back

A user definable data pointer. It’s useful to point this at the
gamestate object or scene management object that owns the space.

=head2 get_static_body

=over 4

=item Arguments:

=item Return Value:

=back

A dedicated static body for the space. You don't have to use it, but
because it's memory is managed automatically with the space it's very
convenient.

=head2 get_current_time_step

=over 4

=item Arguments:

=item Return Value:

=back

Retrieves the current (if you are in a callback from L</step>) or most
recent (outside of a L</step> call) timestep.

=head2 is_locked

=over 4

=item Arguments:

=item Return Value:

=back

Returns true when in a callback meaning that you cannot add/remove
objects from the space. Can be used to choose to create a post-step
callback instead.

=head2 set_default_collision_handler

=over 4

=item Arguments:

=item Return Value:

=back

=head2 add_collision_handler

=over 4

=item Arguments:

=item Return Value:

=back

=head2 remove_collision_handler

=over 4

=item Arguments:

=item Return Value:

=back

=head2 add_shape

=over 4

=item Arguments:

=item Return Value:

=back

=head2 add_static_shape

=over 4

=item Arguments:

=item Return Value:

=back

B<DEPRECATED>

Shapes attached to static bodies are automatically treated as static.
There isn't really a good reason to explicitly add static shapes
anymore.

    $space->add_static_shape($shape);

=head2 add_body

=over 4

=item Arguments:

=item Return Value:

=back

=head2 add_constraint

=over 4

=item Arguments:

=item Return Value:

=back

=head2 remove_shape

=over 4

=item Arguments:

=item Return Value:

=back

=head2 remove_static_shape

=over 4

=item Arguments:

=item Return Value:

=back

B<DEPRECATED>

    $space->remove_static_shape($shape);

See L</"add_static_shape">

=head2 remove_body

=over 4

=item Arguments:

=item Return Value:

=back

=head2 remove_constraint

=over 4

=item Arguments:

=item Return Value:

=back

=head2 contains_shape

=over 4

=item Arguments:

=item Return Value:

=back

=head2 contains_body

=over 4

=item Arguments:

=item Return Value:

=back

=head2 contains_constraint

=over 4

=item Arguments:

=item Return Value:

=back

=head2 convert_body_to_static

=over 4

=item Arguments:

=item Return Value:

=back

Convert a body to a static one. It's mass and moment will be set to
infinity and it's velocity to 0.  The old mass, moment and velocity are
not saved. This will effectively freeze a body and it's shapes into
place. This cannot be called on an active body, so you may need to call
L</"remove_body"> first. Also, because it modifies collision detection
data structures, you must use a post step callback if you want to use it
from another callback or iterator.

    my $static = $space->convert_body_to_static($body);

=head2 convert_body_to_dynamic

=over 4

=item Arguments:

=item Return Value:

=back

Convert a static to a dynamic one. This does not call L</"add_body"> to
make the body active, so you will need to do that explicitly if you need
it. Also, because it modifies collision detection data structures, you
must use a post step callback if you want to use it from another
callback or iterator.

    my $dynamic = $space->convert_body_to_dynamic($body);

=head2 add_post_step_callback

=over 4

=item Arguments:

=item Return Value:

=back

=head2 point_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 point_query_first

=over 4

=item Arguments:

=item Return Value:

=back

=head2 nearest_point_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 segment_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 segment_query_first

=over 4

=item Arguments:

=item Return Value:

=back

=head2 bb_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 shape_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 active_shapes_touching_shape

=over 4

=item Arguments:

=item Return Value:

=back

=head2 each_body

=over 4

=item Arguments:

=item Return Value:

=back

Call C<&func> for each body in the space also passing along your data
pointer. Sleeping bodies are included, but static and rogue bodies are
not as they aren’t added to the space.

=head2 each_shape

=over 4

=item Arguments:

=item Return Value:

=back

Call C<&func> for each shape in the space also passing along your data
pointer. Sleeping and static shapes are included.

=head2 each_constraint

=over 4

=item Arguments:

=item Return Value:

=back

Call C<&func> for each constraint in the space also passing along your
data pointer.

=head2 reindex_static

=over 4

=item Arguments:

=item Return Value:

=back

Reindex all static shapes. Generally updating only the shapes that
changed is faster.

=head2 reindex_shape

=over 4

=item Arguments:

=item Return Value:

=back

Reindex a specific shape.

=head2 reindex_shapes_for_body

=over 4

=item Arguments:

=item Return Value:

=back

Reindex all the shapes for a certain body.

=head2 use_spatial_hash

=over 4

=item Arguments:

=item Return Value:

=back

=head2 step

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Body>, L<Chipmunk::Shape>, L<Chipmunk::Constraint>

=cut

