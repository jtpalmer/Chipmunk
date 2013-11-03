package Chipmunk::GearJoint;

# ABSTRACT: Gear joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::GearJoint', $Chipmunk::GearJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

Keeps the angular velocity ratio of a pair of bodies constant. C<$ratio>
is always measured in absolute terms. It is currently not possible to
set the ratio in relation to a third body’s angular velocity. C<$phase>
is the initial angular offset of the two bodies.

=head1 METHODS

=head2 new

=head2 get_phase

=head2 set_phase

=head2 get_ratio

=head2 set_ratio

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

