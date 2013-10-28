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

=head2 set_elasticity

=head2 get_friction

=head2 set_friction

=head2 get_surface_velocity

=head2 set_surface_velocity

=head2 get_user_data

=head2 set_user_data

=head2 total_impulse

=head2 total_impulse_with_friction

=head2 total_ke

=head2 ignore

=head2 get_shapes

=head2 is_first_contact

=head2 get_count

=head2 get_normal

=head2 get_point

=head2 get_depth

=head1 SEE ALSO

L<Chipmunk::Body>, L<Chipmunk::Space>

=cut

