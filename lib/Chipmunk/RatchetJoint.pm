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
"clicks", C<$phase> is the initial offset to use when deciding where the
ratchet angles are.

=head1 METHODS

=head2 new

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_angle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_angle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_phase

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_phase

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_ratchet

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_ratchet

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

