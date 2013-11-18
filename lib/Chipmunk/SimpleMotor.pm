package Chipmunk::SimpleMotor;

# ABSTRACT: Simple motor

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::SimpleMotor', $Chipmunk::SimpleMotor::VERSION );

1;

__END__

=head1 SYNOPSIS

    $motor = Chipmunk::SimpleMotor->new( $body_a, $body_b, $rate );
    $space->add_constraint($motor);

=head1 DESCRIPTION

Keeps the relative angular velocity of a pair of bodies constant.
C<$rate> is the desired relative angular velocity. You will usually want
to set an force (torque) maximum for motors as otherwise they will be
able to apply a nearly infinite torque to keep the bodies moving.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body_a|Chipmunk::Body>, L<$body_b|Chipmunk::Body>, $rate

=item Return Value: $motor

=back

    $motor = Chipmunk::SimpleMotor->new( $body_a, $body_b, $rate );

=head2 get_rate

=over 4

=item Arguments: none

=item Return Value: $rate

=back

    $rate = $motor->get_rate();

=head2 set_rate

=over 4

=item Arguments: $rate

=item Return Value: not defined

=back

    $motor->set_rate($rate);

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

