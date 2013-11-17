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

    $space = $constraint->get_space();

=head2 get_a

=over 4

=item Arguments: none

=item Return Value: L<$body|Chipmunk::Body>

=back

    $body_a = $constraint->get_a();

=head2 get_b

=over 4

=item Arguments: none

=item Return Value: L<$body|Chipmunk::Body>

=back

    $body_b = $constraint->get_b();

=head2 get_max_force

=over 4

=item Arguments: none

=item Return Value: $max_force

=back

    $max_force = $constraint->get_max_force();

=head2 set_max_force

=over 4

=item Arguments: $max_force

=item Return Value: not defined

=back

=head2 get_error_bias

=over 4

=item Arguments: none

=item Return Value: $error_bias

=back

=head2 set_error_bias

=over 4

=item Arguments: $error_bias

=item Return Value: not defined

=back

=head2 get_max_bias

=over 4

=item Arguments: none

=item Return Value: $max_bias

=back

=head2 set_max_bias

=over 4

=item Arguments: $max_bias

=item Return Value: not defined

=back

=head2 get_user_data

=over 4

=item Arguments: none

=item Return Value: $user_data

=back

=head2 set_user_data

=over 4

=item Arguments: $user_data

=item Return Value: not defined

=back

=head2 get_impulse

=over 4

=item Arguments: none

=item Return Value: $impulse

=back

=head1 SEE ALSO

L<Chipmunk::DampedRotarySpring>, L<Chipmunk::DampedSpring>,
L<Chipmunk::GearJoint>, L<Chipmunk::GrooveJoint>, L<Chipmunk::PinJoint>,
L<Chipmunk::PivotJoint>, L<Chipmunk::RatchetJoint>,
L<Chipmunk::RotaryLimitJoint>, L<Chipmunk::SimpleMotor>,
L<Chipmunk::SlideJoint>

=cut

