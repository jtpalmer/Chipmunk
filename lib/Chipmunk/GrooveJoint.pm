package Chipmunk::GrooveJoint;

# ABSTRACT: Groove joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::GrooveJoint', $Chipmunk::GrooveJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

The groove goes from C<$groove_a> to C<$groove_b> on body C<$a>, and the
pivot is attached to C<$anchr2> on body C<$b>. All coordinates are body
local.

=head1 METHODS

=head2 new

=head2 get_groove_a

=head2 set_groove_a

=head2 get_groove_b

=head2 set_groove_b

=head2 get_anchr2

=head2 set_anchr2

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

