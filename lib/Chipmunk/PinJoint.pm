package Chipmunk::PinJoint;

# ABSTRACT: Pin joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::PinJoint', $Chipmunk::PinJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

    $anchr1 = [ $x1, $y1 ];
    $anchr2 = [ $x2, $y2 ];
    $joint = Chipmunk::PinJoint->new( $body_a, $body_b, $anchr1, $anchr2 );
    $space->add_constraint($joint);

=head1 DESCRIPTION

C<$body_a> and C<$body_b> are the two bodies to connect, and C<$anchr1>
and C<$anchr2> are the anchor points on those bodies. The distance
between the two anchor points is measured when the joint is created. If
you want to set a specific distance, use the setter function to override
it.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body_a|Chipmunk::Body>, L<$body_b|Chipmunk::Body>, L<$anchr1|Chipmunk::Vect>, L<$anchr2|Chipmunk::Vect>

=item Return Value: $joint

=back

    $joint = Chipmunk::PinJoint->new( $body_a, $body_b, $anchr1, $anchr2 );

=head2 get_anchr1

=over 4

=item Arguments: none

=item Return Value: L<$anchr1|Chipmunk::Vect>

=back

=head2 set_anchr1

=over 4

=item Arguments: L<$anchr1|Chipmunk::Vect>

=item Return Value: not defined

=back

=head2 get_anchr2

=over 4

=item Arguments: none

=item Return Value: L<$anchr2|Chipmunk::Vect>

=back

=head2 set_anchr2

=over 4

=item Arguments: L<$anchr2|Chipmunk::Vect>

=item Return Value: not defined

=back

=head2 get_dist

=over 4

=item Arguments: none

=item Return Value: $dist

=back

=head2 set_dist

=over 4

=item Arguments: $dist

=item Return Value: not defined

=back

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

