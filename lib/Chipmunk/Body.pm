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

    $body->activate();

=head2 activate_static

=over 4

=item Arguments: L<$filter|Chipmunk::Shape>?

=item Return Value: not defined

=back

    $body->activate_static();

=head2 sleep

=over 4

=item Arguments: none

=item Return Value: not defined

=back

    $body->sleep();

=head2 sleep_with_group

=over 4

=item Arguments: L<$group|Chipmunk::Body>

=item Return Value: not defined

=back

    $body->sleep_with_group($group);

=head2 is_sleeping

=over 4

=item Arguments: none

=item Return Value: $is_sleeping

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

    $i = $body->get_moment();

=head2 set_moment

=over 4

=item Arguments: $i

=item Return Value: not defined

=back

    $body->set_moment($i);

=head2 get_pos

=over 4

=item Arguments: none

=item Return Value: L<$pos|Chipmunk::Vect>

=back

    $pos = $body->get_pos();

=head2 set_pos

=over 4

=item Arguments: L<$pos|Chipmunk::Vect>

=item Return Value: not defined

=back

    $body->set_pos($pos);

=head2 get_vel

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_vel

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_force

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_force

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_angle

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_angle

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_ang_vel

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_ang_vel

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_torque

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_torque

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_rot

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 get_vel_limit

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_vel_limit

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_ang_vel_limit

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_ang_vel_limit

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 get_user_data

=over 4

=item Arguments: none

=item Return Value:

=back

=head2 set_user_data

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 update_velocity

=over 4

=item Arguments:

=item Return Value:

=back

=head2 local_to_world

=over 4

=item Arguments:

=item Return Value:

=back

=head2 world_to_local

=over 4

=item Arguments:

=item Return Value:

=back

=head2 reset_forces

=over 4

=item Arguments:

=item Return Value: not defined

=back

=head2 apply_force

=over 4

=item Arguments:

=item Return Value:

=back

=head2 apply_impulse

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_vel_at_world_point

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_vel_at_local_point

=over 4

=item Arguments:

=item Return Value:

=back

=head2 kinetic_energy

=over 4

=item Arguments:

=item Return Value:

=back

=head2 shape_iterator

=over 4

=item Arguments:

=item Return Value:

=back

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

