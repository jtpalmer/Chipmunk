package Chipmunk::Arbiter;

# ABSTRACT: Controls pairs of colliding shapes

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Arbiter', $Chipmunk::Arbiter::VERSION );

1;

__END__

=head1 SYNOPSIS

    # Arbiters are not created directly, they are passed to callback
    # functions.
    $space->set_default_collision_handler(
        sub {
            my ( $arbiter, $space, $data ) = @_;

            $arbiter->set_elasticity(0.5);
        },
        # ...
    );

=head1 DESCRIPTION

The Arbiter class controls pairs of colliding shapes.

They are also used in conjuction with collision handler callbacks
allowing you to retrieve information on the collision and control it.

=head1 METHODS

=head2 get_elasticity

=over 4

=item Arguments: none

=item Return Value: $elasticity

=back

Get the calculated elasticity for this collision pair.  The default
calculation multiplies the elasticity of the two shapes together.

=head2 set_elasticity

=over 4

=item Arguments: $elasticity

=item Return Value: not defined

=back

Set the elasticity.  Setting the value in a
L<pre_solve|Chipmunk::Space/set_default_collision_handler> callback
will override the value calculated by the space.

=head2 get_friction

=over 4

=item Arguments: none

=item Return Value: $friction

=back

The calculated friction for this collision pair.  The default
calculation multiplies the friction of the two shapes together.

=head2 set_friction

=over 4

=item Arguments: $friction

=item Return Value: not defined

=back

Set the friction for this collision pair.  Setting the value in a
L<pre_solve|Chipmunk::Space/set_default_collision_handler> callback
will override the value calculated by the space.

=head2 get_surface_velocity

=over 4

=item Arguments: none

=item Return Value: $velocity

=back

Get the calculated surface velocity for this collision pair. The default
calculation subtracts the surface velocity of the second shape from the
first and then projects that onto the tangent of the collision. This is
so that only friction is affected by default calculation. Using a custom
calculation, you can make something that responds like a pinball bumper,
or where the surface velocity is dependent on the location of the
contact point.

B<NOTE>: Unfortunately there is an old bug where the surface velocity is
calculated backwards (negative). I didn't really notice this for a long
time. It will be fixed in Chipmunk 7, but for now I've left it alone for
backwards compatibility reasons.

=head2 set_surface_velocity

=over 4

=item Arguments: $velocity

=item Return Value: not defined

=back

Set the calculated surface velocity for this collision pair. Setting
the value in a
L<pre_solve|Chipmunk::Space/set_default_collision_handler> callback
will override the value calculated by the space.

=head2 get_user_data

=over 4

=item Arguments: none

=item Return Value:

=back

Get user data.

=head2 set_user_data

=over 4

=item Arguments:

=item Return Value: not defined

=back

Set user data.

=head2 total_impulse

=over 4

=item Arguments: none

=item Return Value:

=back

Returns the impulse that was applied this step to resolve the collision.

=head2 total_impulse_with_friction

=over 4

=item Arguments:

=item Return Value:

=back

Returns the impulse, with friction, that was applied this step to
resolve the collision.

=head2 total_ke

=over 4

=item Arguments:

=item Return Value:

=back

Calculate the amount of energy lost in a collision including static, but
not dynamic friction

=head2 ignore

=over 4

=item Arguments: none

=item Return Value: not defined

=back

Reject the collision.

=head2 get_shapes

=over 4

=item Arguments: none

=item Return Value:

=back

Get the shapes in the order that they were defined in the collision
handler associated with this arbiter.

=head2 is_first_contact

=over 4

=item Arguments: none

=item Return Value:

=back

Returns true if this is the first step the two shapes started touching.
This can be useful for sound effects for instance. If it's the first
frame for a certain collision, check the energy of the collision in a
L<post_step> callbock and use that to determine the volume of a sound
effect to play.

=head2 get_count

=over 4

=item Arguments: none

=item Return Value:

=back

Get the number of contacts tracked by this arbiter.

=head2 get_normal

=over 4

=item Arguments: none

=item Return Value:

=back

Get the collision normal of this arbiter.

=head2 get_point

=over 4

=item Arguments: none

=item Return Value:

=back

Get the collision point of this arbiter.

=head2 get_depth

=over 4

=item Arguments: none

=item Return Value:

=back

Get the penetration depth of the collision point of this arbiter.

=head1 SEE ALSO

L<Chipmunk::Body>, L<Chipmunk::Space>

=cut

