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

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 new_static

=head2 free

=head2 activate

=head2 activate_static

=head2 sleep

=head2 sleep_with_group

=head2 is_sleeping

=head2 is_static

=head2 is_rogue

=head2 get_space

=head2 get_mass

=head2 set_mass

=head2 get_moment

=head2 set_moment

=head2 get_pos

=head2 set_pos

=head2 get_vel

=head2 set_vel

=head2 get_force

=head2 set_force

=head2 get_angle

=head2 set_angle

=head2 get_ang_vel

=head2 set_ang_vel

=head2 get_torque

=head2 set_torque

=head2 get_rot

=head2 get_vel_limit

=head2 set_vel_limit

=head2 get_ang_vel_limit

=head2 set_ang_vel_limit

=head2 get_user_data

=head2 set_user_data

=head2 update_velocity

=head2 local_to_world

=head2 world_to_local

=head2 reset_forces

=head2 apply_force

=head2 apply_impulse

=head2 get_vel_at_world_point

=head2 get_vel_at_local_point

=head2 kinetic_energy

=head2 shape_iterator

=head2 each_constraint

=head2 each_arbiter

=cut

