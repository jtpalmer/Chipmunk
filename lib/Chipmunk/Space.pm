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

=head2 get_iterations

=head2 set_iterations

=head2 get_gravity

=head2 set_gravity

=head2 get_damping

=head2 set_damping

=head2 get_idle_speed_threshold

=head2 set_idle_speed_threshold

=head2 get_sleep_time_threshold

=head2 set_sleep_time_threshold

=head2 get_collision_slop

=head2 set_collision_slop

=head2 get_collision_bias

=head2 set_collision_bias

=head2 get_collision_persistence

=head2 set_collision_persistence

=head2 get_enable_contact_graph

=head2 set_enable_contact_graph

=head2 get_user_data

=head2 set_user_data

=head2 get_static_body

=head2 set_static_body

=head2 get_static_body

=head2 get_current_time_step

=head2 is_locked

=head2 add_shape

=head2 add_static_shape

=head2 add_body

=head2 add_constraint

=head2 remove_shape

=head2 remove_static_shape

=head2 remove_body

=head2 remove_constraint

=head2 contains_shape

=head2 contains_body

=head2 contains_constraint

=head2 convert_body_to_static

Convert a body to a static one. It’s mass and moment will be set to
infinity and it’s velocity to 0.  The old mass, moment and velocity are
not saved. This will effectively freeze a body and it’s shapes into
place. This cannot be called on an active body, so you may need to call
L</"remove_body"> first. Also, because it modifies collision detection
data structures, you must use a post step callback if you want to use it
from another callback or iterator.

    my $static = $space->convert_body_to_static($body);

=head2 convert_body_to_dynamic

Convert a static to a dynamic one. This does not call L</"add_body"> to
make the body active, so you will need to do that explicitly if you need
it. Also, because it modifies collision detection data structures, you
must use a post step callback if you want to use it from another
callback or iterator.

    my $dynamic = $space->convert_body_to_dynamic($body);

=head2 add_post_step_callback

=head2 reindex_static

=head2 reindex_shape

=head2 reindex_shapes_for_body

=head2 use_spatial_hash

=head2 step

=cut

