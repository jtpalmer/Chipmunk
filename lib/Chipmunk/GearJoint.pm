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

   $joint = Chipmunk::GearJoint->new( $body_a, $body_b, $phase, $ratio );
   $space->add_constraint($joint);

=head1 DESCRIPTION

Keeps the angular velocity ratio of a pair of bodies constant. C<$ratio>
is always measured in absolute terms. It is currently not possible to
set the ratio in relation to a third body’s angular velocity. C<$phase>
is the initial angular offset of the two bodies.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body_a|Chipmunk::Body>, L<$body_b|Chipmunk::Body>, $phase, $ratio

=item Return Value: $joint

=back

   $joint = Chipmunk::GearJoint->new( $body_a, $body_b, $phase, $ratio );

=head2 get_phase

=over 4

=item Arguments: none

=item Return Value: $phase

=back

    $phase = $joint->get_phase();

=head2 set_phase

=over 4

=item Arguments: $phase

=item Return Value: not defined

=back

    $joint->set_phase($phase);

=head2 get_ratio

=over 4

=item Arguments: none

=item Return Value: $ratio

=back

    $ratio = $joint->get_ratio();

=head2 set_ratio

=over 4

=item Arguments: $ratio

=item Return Value: not defined

=back

    $joint->set_ratio($ratio);

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

