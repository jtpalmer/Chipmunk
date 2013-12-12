package Chipmunk::Body;

# ABSTRACT: Rigid body type

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Body', $Chipmunk::Body::VERSION );

1;

__END__

=head1 SYNOPSIS

    $body = Chipmunk::Body->new( $mass, $inertia );
    $space->add_body($body);
    $body->set_pos( [ $x, $y ] );

=head1 DESCRIPTION

Chipmunk's rigid body type.

Rigid bodies hold the physical properties of an object like it's mass,
and position and velocity of it's center of gravity. They don't have an
shape on their own. They are given a shape by creating collision shapes
L<Chipmunk::Shape> that point to the body.

=head2 Rogue and Static Bodies

Normally when you create a rigid body, you add it to a space so the
space will start simulating it. This means it will update it's position
and velocity, apply forces to it, be affected by gravity, etc. A body
that isn't added to a space (and not simulated) is called a rogue body.
The most important use for rogue bodies are as static bodies, but you
can also use them to implement directly controlled objects such as
moving platforms.

Static bodies are rogue bodies, but with a special flag set on them to
let Chipmunk know that they never move unless you tell it. Static bodies
have two purposes. Originally they were added for the sleeping feature.
Because static bodies don't move, Chipmunk knows that it's safe to let
objects that are touching or jointed to them fall asleep. Objects
touching or jointed to regular rogue bodies are never allowed to sleep.
The second purpose for static bodies is that Chipmunk knows shapes
attached to them never need to have their collision detection data
updated. Chipmunk also doesn't need to bother checking for collisions
between static objects. Generally all of your level geometry will be
attached to a static body except for things like moving platforms or
doors.

In previous versions of Chipmunk before 5.3 you would create an infinite
mass rogue body to attach static shapes to using
L<Chipmunk::Space/add_static_shape>. You don't need to do any of that
anymore, and shouldn't if you want to use the sleeping feature. Each
space has a dedicated static body that you can use to attach your static
shapes to. Chipmunk also automatically adds shapes attached to static
bodies as static shapes.

=head1 METHODS

=head2 new

=over 4

=item Arguments: $mass, $inertia

=item Return Value: $body

=back

    $body = Chipmunk::Body->new( $mass, $inertia );

=head2 new_static

=over 4

=item Arguments: none

=item Return Value: L<$body|/new>

=back

    $body = Chipmunk::Body->new_static();

=head2 activate

=over 4

=item Arguments: none

=item Return Value: not defined

=back

Reset the idle timer on a body. If it was sleeping, wake it and any
other bodies it was touching.

    $body->activate();

=head2 activate_static

=over 4

=item Arguments: L<$filter|Chipmunk::Shape>?

=item Return Value: not defined

=back

Similar in function to L</activate>. Activates all bodies touching body.
If filter is not C<undef>, then only bodies touching through filter will
be awoken.

    $body->activate_static();

=head2 sleep

=over 4

=item Arguments: none

=item Return Value: not defined

=back

Forces the body to fall asleep immediately even if it's in midair.
Cannot be called from a callback.

    $body->sleep();

=head2 sleep_with_group

=over 4

=item Arguments: L<$group|Chipmunk::Body>

=item Return Value: not defined

=back

When objects in Chipmunk sleep, they sleep as a group of all objects
that are touching or jointed together. When an object is woken up, all
of the objects in it's group are woken up. C<sleep_with_group> allows
you group sleeping objects together. It acts identically to L</sleep> if
you pass C<undef> as C<$group> by starting a new group. If you pass a
sleeping body for C<$group>, body will be awoken when C<$group> is
awoken. You can use this to initialize levels and start stacks of
objects in a pre-sleeping state.

    $body->sleep_with_group($group);

=head2 is_sleeping

=over 4

=item Arguments: none

=item Return Value: $is_sleeping

Returns true if the body is sleeping.

=back

    if ( $body->is_sleeping() ) {
        print "body is sleeping\n";
    }

=head2 is_static

=over 4

=item Arguments: none

=item Return Value: $is_static

=back

    if ( $body->is_static() ) {
        print "body is static\n";
    }

=head2 is_rogue

=over 4

=item Arguments: none

=item Return Value: $is_rogue

=back

    if ( $body->is_rogue() ) {
        print "body is rogue\n";
    }

=head2 get_space

=over 4

=item Arguments: none

=item Return Value: L<$space|Chipmunk::Space>

=back

Get the L<Chipmunk::Space> that C<body> has been added to.

    $space = $body->get_space();

=head2 get_mass

=over 4

=item Arguments: none

=item Return Value: $mass

=back

Get the mass of the body.

    $mass = $body->get_mass();

=head2 set_mass

=over 4

=item Arguments: $mass

=item Return Value: not defined

=back

Set the mass of the body.

    $body->set_mass($mass);

=head2 get_moment

=over 4

=item Arguments: none

=item Return Value: $i

=back

Get the moment of inertia (MoI or sometimes just moment) of the body.
The moment is like the rotational mass of a body.

    $i = $body->get_moment();

=head2 set_moment

=over 4

=item Arguments: $i

=item Return Value: not defined

=back

Set the moment of inertia.

    $body->set_moment($i);

=head2 get_pos

=over 4

=item Arguments: none

=item Return Value: L<$pos|Chipmunk::Vect>

=back

Get the position of the center of gravity of the body.

    $pos = $body->get_pos();

=head2 set_pos

=over 4

=item Arguments: L<$pos|Chipmunk::Vect>

=item Return Value: not defined

=back

Set the position of the center of gravity of the body.

When changing the position you may also want to call
L<Chipmunk::Space/reindex_shapes_for_body> to update the collision
detection information for the attached shapes if plan to make any
queries against the space.

    $body->set_pos($pos);

=head2 get_vel

=over 4

=item Arguments: none

=item Return Value: L<$vel|Chipmunk::Vect>

=back

Get the linear velocity of the center of gravity of the body.

    $vel = $body->get_vel();

=head2 set_vel

=over 4

=item Arguments: L<$vel|Chipmunk::Vect>

=item Return Value: not defined

=back

Set the linear velocity of the center of gravity of the body.

    $body->set_vel($vel);

=head2 get_force

=over 4

=item Arguments: none

=item Return Value: L<$force|Chipmunk::Vect>

=back

Get the force applied to the center of gravity of the body.

    $force = $body->get_force();

=head2 set_force

=over 4

=item Arguments: L<$force|Chipmunk::Vect>

=item Return Value: not defined

=back

Set the force applied to the center of gravity of the body.

    $body->set_force($force);

=head2 get_angle

=over 4

=item Arguments: none

=item Return Value: $angle

=back

Get the rotation of the body in radians.

    $angle = $body->get_angle();

=head2 set_angle

=over 4

=item Arguments: $angle

=item Return Value: not defined

=back

Set the rotation of the body in radians.

When changing the rotation you may also want to call
L<Chipmunk::Space/reindex_shapes_for_body> to update the collision
detection information for the attached shapes if plan to make any
queries against the space.

    $body->set_angle($angle);

=head2 get_ang_vel

=over 4

=item Arguments: none

=item Return Value: $vel

=back

Get the angular velocity of the body in radians per second.

    $vel = $body->get_ang_vel();

=head2 set_ang_vel

=over 4

=item Arguments: $vel

=item Return Value: not defined

=back

Set the angular velocity of the body in radians per second.

    $body->set_ang_vel($vel);

=head2 get_torque

=over 4

=item Arguments: none

=item Return Value: $torque

=back

Get the torque applied to the body.

    $torque = $body->get_torque();

=head2 set_torque

=over 4

=item Arguments: $torque

=item Return Value: not defined

=back

Set the torque applied to the body.

    $body->set_torque($torque);

=head2 get_rot

=over 4

=item Arguments: none

=item Return Value: L<$rot|Chipmunk::Vect>

=back

Get the rotation vector for the body. Can be used with
L<Chipmunk::Vect/cpvrotate> or L<Chipmunk::Vect/cpvunrotate> to perform
fast rotations.

    $rot = $body->get_rot();

=head2 get_vel_limit

=over 4

=item Arguments: none

=item Return Value: $vel_limit

=back

Get the velocity limit of the body. Defaults to INFINITY unless you set
it specifically. Can be used to limit falling speeds, etc.

    $vel_limit = $body->get_vel_limit();

=head2 set_vel_limit

=over 4

=item Arguments: $vel_limit

=item Return Value: not defined

=back

Set the velocity limit of the body.

    $body->set_vel_limit($vel_limit);

=head2 get_ang_vel_limit

=over 4

=item Arguments: none

=item Return Value: $ang_vel_limit

=back

Get the angular velocity limit of the body in radians per second.
Defaults to INFINITY unless you set it specifically.

    $ang_vel_limit = $body->get_ang_vel_limit();

=head2 set_ang_vel_limit

=over 4

=item Arguments: $ang_vel_limit

=item Return Value: not defined

=back

Set the angular velocity limit of the body in radians per second.

    $body->set_ang_vel_limit($ang_vel_limit);

=head2 get_user_data

=over 4

=item Arguments: none

=item Return Value: $user_data

=back

Get the user data.

    $user_data = $body->get_user_data();

=head2 set_user_data

=over 4

=item Arguments: $user_data

=item Return Value: not defined

=back

Set the user data.

    $body->set_user_data($user_data);

=head2 update_velocity

=over 4

=item Arguments: L<$gravity|Chipmunk::Vect>, $damping, $dt

=item Return Value: not defined

=back

    $body->update_velocity( $gravity, $damping, $dt );

=head2 update_position

=over 4

=item Arguments: $dt

=item Return Value: not defined

=back

    $body->update_position($dt);

=head2 local_to_world

=over 4

=item Arguments: L<$local_coords|Chipmunk::Vect>

=item Return Value: L<$world_coords|Chipmunk::Vect>

=back

Convert from body local coordinates to world space coordinates.

    $world_coords = $body->local_to_world($local_coords);

=head2 world_to_local

=over 4

=item Arguments: L<$world_coords|Chipmunk::Vect>

=item Return Value: L<$local_coords|Chipmunk::Vect>

=back

Convert from world space coordinates to body local coordinates.

    $local_coords = $body->world_to_local($world_coords);

=head2 reset_forces

=over 4

=item Arguments: none

=item Return Value: not defined

=back

Zero both the forces and torques currently applied to the body.

    $body->reset_forces();

=head2 apply_force

=over 4

=item Arguments: L<$f|Chipmunk::Vect>, L<$r|Chipmunk::Vect>

=item Return Value: not defined

=back

Add the force C<$f> to C<$body> at a relative offset C<$r> from the
center of gravity.

Takes a forces in absolute coordinates and applies it at a relative
offset in absolute coordinates. (The offset is relative to the center
of gravity, but is I<not> rotated with the body.)

    $body->apply_force( $d, $r );

=head2 apply_impulse

=over 4

=item Arguments:

=item Return Value: L<$j|Chipmunk::Vect>, L<$r|Chipmunk::Vect>

=back

Add the impulse C<$j> to C<$body> at a relative offset C<$r> from the
center of gravity.

Takes an impulse in absolute coordinates and applies it at a relative
offset in absolute coordinates. (The offset is relative to the center of
gravity, but is I<not> rotated with the body.)

    $body->apply_impulse( $j, $r );

=head2 get_vel_at_world_point

=over 4

=item Arguments: L<$point|Chipmunk::Vect>

=item Return Value: L<$vel|Chipmunk::Vect>

=back

    $vel = $body->get_vel_at_world_point($point);

=head2 get_vel_at_local_point

=over 4

=item Arguments: L<$point|Chipmunk::Vect>

=item Return Value: L<$vel|Chipmunk::Vect>

=back

    $vel = $body->get_vel_at_local_point($point);

=head2 kinetic_energy

=over 4

=item Arguments:

=item Return Value:

=back

=head2 each_shape

=over 4

=item Arguments: &func, $data?

=item Return Value: not defined

=back

Call C<&func> once for each shape that is attached to body and added to
a space. C<$data> is passed along as a context value. It is safe to
remove shapes using these callbacks.

    $body->each_shape(
        sub {
            my ( $shape, $data ) = @_;

            # ...
        },
        $data
    );


=head2 each_constraint

=over 4

=item Arguments:

=item Return Value:

=back

=head2 each_arbiter

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Shape>, L<Chipmunk::Space>

=cut

