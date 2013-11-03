package Chipmunk::PivotJoint;

# ABSTRACT: Pivot joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::PivotJoint', $Chipmunk::PivotJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

C<$a> and C<$b> are the two bodies to connect, and C<$pivot> is the
point in world coordinates of the pivot. Because the pivot location is
given in world coordinates, you must have the bodies moved into the
correct positions already. Alternatively you can specify the joint based
on a pair of anchor points, but make sure you have the bodies in the
right place as the joint will fix itself as soon as you start simulating
the space.

=head1 METHODS

=head2 new

=head2 get_anchr1

=head2 set_anchr1

=head2 get_anchr2

=head2 set_anchr2

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

