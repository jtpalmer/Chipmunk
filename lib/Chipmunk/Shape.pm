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

=item Arguments: none

=item Return Value: L<$body|Chipmunk::Body>

=back

Get the rigid body the shape is attached to.

    $body = $shape->get_body();

=head2 set_body

=over 4

=item Arguments: L<$body|Chipmunk::Body>

=item Return Value: not defined

=back

Set the rigid body the shape is attached to. Can only be set when the
shape is not added to a space.

    $shape->set_body($body);

=head2 get_bb

=over 4

=item Arguments: none

=item Return Value: L<$bb|Chipmunk::BB>

=back

Get the bounding box of the shape. Only guaranteed to be valid after
L</cache_bb> or L<Chipmunk::Space/step> is called. Moving a body that a
shape is connected to does not update it's bounding box. For shapes used
for queries that aren't attached to bodies, you can also use L</update>.

=head2 get_sensor

=over 4

=item Arguments: none

=item Return Value: $is_sensor

=back

A boolean value if this shape is a sensor or not. Sensors only call
collision callbacks, and never generate real collisions.

=head2 set_sensor

=over 4

=item Arguments: $is_sensor

=item Return Value: not defined

=back

A boolean value if this shape is a sensor or not. Sensors only call
collision callbacks, and never generate real collisions.

=head2 get_elasticity

=over 4

=item Arguments: none

=item Return Value: $elasticity

=back

Get the elasticity of the shape. A value of 0.0 gives no bounce, while a
value of 1.0 will give a "perfect" bounce. However due to inaccuracies
in the simulation using 1.0 or greater is not recommended however. The
elasticity for a collision is found by multiplying the elasticity of the
individual shapes together.

=head2 set_elasticity

=over 4

=item Arguments: $elasticity

=item Return Value: not defined

=back

Set the elasticity of the shape. A value of 0.0 gives no bounce, while a
value of 1.0 will give a "perfect" bounce. However due to inaccuracies
in the simulation using 1.0 or greater is not recommended however. The
elasticity for a collision is found by multiplying the elasticity of the
individual shapes together.

=head2 get_friction

=over 4

=item Arguments: none

=item Return Value: $friction

=back

Get the friction coefficient. Chipmunk uses the Coulomb friction model,
a value of 0.0 is frictionless. The friction for a collision is found by
multiplying the friction of the individual shapes together.

L<Tables of friction coefficients|http://www.roymech.co.uk/Useful_Tables/Tribology/co_of_frict.htm>

=head2 set_friction

=over 4

=item Arguments: $friction

=item Return Value: not defined

=back

Set the friction coefficient. Chipmunk uses the Coulomb friction model,
a value of 0.0 is frictionless. The friction for a collision is found by
multiplying the friction of the individual shapes together.

L<Tables of friction coefficients|http://www.roymech.co.uk/Useful_Tables/Tribology/co_of_frict.htm>

=head2 get_surface_velocity

=over 4

=item Arguments: none

=item Return Value: $vel

=back

Get the surface velocity of the object. This value is only used when
calculating friction, not resolving the collision.

=head2 set_surface_velocity

=over 4

=item Arguments: $vel

=item Return Value: not defined

=back

Set the surface velocity of the object. Useful for creating conveyor
belts or players that move around. This value is only used when
calculating friction, not resolving the collision.

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

