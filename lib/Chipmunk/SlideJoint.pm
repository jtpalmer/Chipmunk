package Chipmunk::SlideJoint;

# ABSTRACT: Slide joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::SlideJoint', $Chipmunk::SlideJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

C<$a> and C<$b> are the two bodies to connect, C<$anchr1> and C<$anchr2>
are the anchor points on those bodies, and C<$min> and C<$max> define
the allowed distances of the anchor points.

=head1 METHODS

=head2 new

=head2 get_anchr1

=head2 set_anchr1

=head2 get_anchr2

=head2 set_anchr2

=head2 get_min

=head2 set_min

=head2 get_max

=head2 set_max

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

