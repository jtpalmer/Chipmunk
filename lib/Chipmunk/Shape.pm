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

    $space = $shape->get_space();
    $body = $shape->get_body();

=head1 DESCRIPTION

There are currently 3 collision shape types:

=over 4

=item *

Circles: Fastest and simplest collision shape.

=item *

Line segments: Meant mainly as a static shape. Can be beveled in order
to give them a thickness.

=item *

Convex polygons: Slowest, but most flexible collision shape.

=back

You can add as many shapes to a body as you wish. That is why the two
types are separate. This should give you the flexibility to make any
shape you want as well providing different areas of the same object with
different friction, elasticity or callback values.

=head1 METHODS

=head2 cache_bb

=over 4

=item Arguments:

=item Return Value:

=back

Synchronizes the shape with the body its attached to.

=head2 update

=over 4

=item Arguments:

=item Return Value:

=back

Sets the position and rotation of the shape.

=head2 point_query

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_space

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_body

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_body

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_bb

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_sensor

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_sensor

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_elasticity

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_elasticity

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_friction

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_friction

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_surface_velocity

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_surface_velocity

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_collision_type

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_collision_type

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_group

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_group

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_layers

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_layers

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::CircleShape>, L<Chipmunk::PolyShape>,
L<Chipmunk::SegmentShape>

=cut

