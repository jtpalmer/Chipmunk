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

    $joint = Chipmunk::SlideJoint->new( $body_a, $body_b, $anchr1, $anchr2,
        $min, $max );
    $space-add_constraint($joint);

=head1 DESCRIPTION

C<$body_a> and C<$body_b> are the two bodies to connect, C<$anchr1> and
C<$anchr2> are the anchor points on those bodies, and C<$min> and
C<$max> define the allowed distances of the anchor points.

=head1 METHODS

=head2 new

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_anchr1

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_anchr1

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_anchr2

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_anchr2

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_min

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_min

=over 4

=item Arguments:

=item Return Value:

=back

=head2 get_max

=over 4

=item Arguments:

=item Return Value:

=back

=head2 set_max

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

