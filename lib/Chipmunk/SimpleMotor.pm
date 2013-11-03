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

=head1 DESCRIPTION

Keeps the relative angular velocity of a pair of bodies constant.
C<$rate> is the desired relative angular velocity. You will usually want
to set an force (torque) maximum for motors as otherwise they will be
able to apply a nearly infinite torque to keep the bodies moving.

=head1 METHODS

=head2 new

=head2 get_rate

=head2 set_rate

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

