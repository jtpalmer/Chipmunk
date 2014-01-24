package Chipmunk::Constraint;

# ABSTRACT: Opaque constraint

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Constraint', $Chipmunk::Constraint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

A constraint is something that describes how two bodies interact with
each other. (how they constrain each other) Constraints can be simple
joints that allow bodies to pivot around each other like the bones in
your body, or they can be more abstract like the gear joint or motors.

=head2 What constraints are and what they are not

Constraints in Chipmunk are all velocity based constraints. This means
that they act primarily by synchronizing the velocity of two bodies. A
pivot joint holds two anchor points on two separate bodies together by
defining equations that say that the velocity of the anchor points must
be the same and calculating impulses to apply to the bodies to try and
keep it that way. A constraint takes a velocity as it's primary input
and produces a velocity change as it's output. Some constraints,
(joints in particular) apply velocity changes to correct differences
in positions. More about this in the next section.

A spring connected between two bodies is not a constraint. It's very
constraint-like as it creates forces that affect the velocities of the
two bodies, but a spring takes distances as input and produces forces
as it's output. If a spring is not a constraint, then why do I have
two varieties of spring constraints you ask? The reason is because
they are damped springs. The damping associated with the spring is a
true constraint that creates velocity changes based on the relative
velocities of the two bodies it links. As it is convenient to put a
damper and a spring together most of the time, I figured I might as well
just apply the spring force as part of the constraint instead of having
a damper constraint and having the user calculate and apply their own
spring forces separately.

=head1 METHODS

=head2 activate_bodies

=over 4

=item Arguments: none

=item Return Value: not defined

=back

    $constraint->activate_bodies();

=head2 get_space

=over 4

=item Arguments: none

=item Return Value: L<$space|Chipmunk::Space>

=back

Get the L<Space|Chipmunk::Space> that the constraint has been added
to.

    $space = $constraint->get_space();

=head2 get_a

=over 4

=item Arguments: none

=item Return Value: L<$body|Chipmunk::Body>

=back

Get the first body the constraint is attached to.

    $body_a = $constraint->get_a();

=head2 get_b

=over 4

=item Arguments: none

=item Return Value: L<$body|Chipmunk::Body>

=back

Get the second body the constraint is attached to.

    $body_b = $constraint->get_b();

=head2 get_max_force

=over 4

=item Arguments: none

=item Return Value: $max_force

=back

Get the maximum force that the constraint can use to act on the
two bodies. Defaults to INFINITY.

    $max_force = $constraint->get_max_force();

=head2 set_max_force

=over 4

=item Arguments: $max_force

=item Return Value: not defined

=back

Set the maximum force that the constraint can use to act on the
two bodies. Defaults to INFINITY.

=head2 get_error_bias

=over 4

=item Arguments: none

=item Return Value: $error_bias

=back

Get the percentage of joint error that remains unfixed after a second.
This works exactly the same as the collision bias property of a space,
but applies to fixing error (stretching) of joints instead of
overlapping collisions.

=head2 set_error_bias

=over 4

=item Arguments: $error_bias

=item Return Value: not defined

=back

Set the percentage of joint error that remains unfixed after a second.
This works exactly the same as the collision bias property of a space,
but applies to fixing error (stretching) of joints instead of
overlapping collisions.

=head2 get_max_bias

=over 4

=item Arguments: none

=item Return Value: $max_bias

=back

Get the maximum speed at which the constraint can apply error
correction. Defaults to INFINITY.

=head2 set_max_bias

=over 4

=item Arguments: $max_bias

=item Return Value: not defined

=back

Set the maximum speed at which the constraint can apply error
correction. Defaults to INFINITY.

=head2 get_user_data

=over 4

=item Arguments: none

=item Return Value: $user_data

=back

Get user data pointer. Use this pointer to get a reference to the game
object that owns this constraint from callbacks.

=head2 set_user_data

=over 4

=item Arguments: $user_data

=item Return Value: not defined

=back

Set user data pointer. Use this pointer to get a reference to the game
object that owns this constraint from callbacks.

=head2 get_impulse

=over 4

=item Arguments: none

=item Return Value: $impulse

=back

The most recent impulse that this constraint applied. To convert this to
a force, divide by the timestep passed to L<step|Chipmunk::Space/step>.
You can use this to implement breakable joints to check if the force
they attempted to apply exceeded a certain threshold.

=head1 SEE ALSO

L<Chipmunk::DampedRotarySpring>, L<Chipmunk::DampedSpring>,
L<Chipmunk::GearJoint>, L<Chipmunk::GrooveJoint>, L<Chipmunk::PinJoint>,
L<Chipmunk::PivotJoint>, L<Chipmunk::RatchetJoint>,
L<Chipmunk::RotaryLimitJoint>, L<Chipmunk::SimpleMotor>,
L<Chipmunk::SlideJoint>

=cut

