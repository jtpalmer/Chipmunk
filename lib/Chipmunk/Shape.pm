package Chipmunk::Shape;

# ABSTRACT: Defines the shape of a rigid body

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Shape', $Chipmunk::Shape::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

There are currently 3 collision shape types:

=over 4

=item

Circles: Fastest and simplest collision shape.

=item

Line segments: Meant mainly as a static shape. Can be beveled in order
to give them a thickness.

=item

Convex polygons: Slowest, but most flexible collision shape.

=back

You can add as many shapes to a body as you wish. That is why the two
types are separate. This should give you the flexibility to make any
shape you want as well providing different areas of the same object with
different friction, elasticity or callback values.

=head1 METHODS

=head2 cache_bb

=head2 update

=head2 point_query

=head2 get_space

=head2 get_body

=head2 set_body

=head2 get_bb

=head2 get_sensor

=head2 set_sensor

=head2 get_elasticity

=head2 set_elasticity

=head2 get_friction

=head2 set_friction

=head2 get_surface_velocity

=head2 set_surface_velocity

=head2 get_collision_type

=head2 set_collision_type

=head2 get_group

=head2 set_group

=head2 get_layers

=head2 set_layers

=head1 SEE ALSO

L<Chipmunk::CircleShape>, L<Chipmunk::PolyShape>,
L<Chipmunk::SegmentShape>

=cut

