package Chipmunk::RatchetJoint;

# ABSTRACT: Ratchet joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::RatchetJoint', $Chipmunk::RatchetJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

Works like a socket wrench. C<$ratchet> is the distance between
“clicks”, C<$phase> is the initial offset to use when deciding where the
ratchet angles are.

=head1 METHODS

=head2 new

=head2 get_angle

=head2 set_angle

=head2 get_phase

=head2 set_phase

=head2 get_ratchet

=head2 set_ratchet

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

