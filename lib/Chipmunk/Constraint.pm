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

    $constraint->activate_bodies();

=head2 get_space

    my $space = $constraint->get_space();

=head2 get_a

    my $body_a = $constraint->get_a();

=head2 get_b

    my $body_b = $constraint->get_b();

=head2 get_max_force

=head2 set_max_force

=head2 get_error_bias

=head2 set_error_bias

=head2 get_max_bias

=head2 get_max_bias

=head2 get_user_data

=head2 set_user_data

=head2 get_impulse

=head1 SEE ALSO

L<Chipmunk::DampedRotarySpring>, L<Chipmunk::DampedSpring>,
L<Chipmunk::GearJoint>, L<Chipmunk::GrooveJoint>, L<Chipmunk::PinJoint>,
L<Chipmunk::PivotJoint>, L<Chipmunk::RatchetJoint>,
L<Chipmunk::RotaryLimitJoint>, L<Chipmunk::SimpleMotor>,
L<Chipmunk::SlideJoint>

=cut

