package Chipmunk::RotaryLimitJoint;

# ABSTRACT: Rotary limit joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::RotaryLimitJoint',
    $Chipmunk::RotaryLimitJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

    $joint = Chipmunk::RotaryLimitJoint->new( $body_a, $body_b, $min, $max );
    $space->add_constraint($joint);

=head1 DESCRIPTION

Constrains the relative rotations of two bodies. C<$min> and C<$max> are
the angular limits in radians. It is implemented so that it’s possible
to for the range to be greater than a full revolution.

=head1 METHODS

=head2 new

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

