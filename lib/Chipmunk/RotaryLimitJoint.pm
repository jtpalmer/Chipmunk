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

=head1 DESCRIPTION

Constrains the relative rotations of two bodies. C<$min> and C<$max> are
the angular limits in radians. It is implemented so that it’s possible
to for the range to be greater than a full revolution.

=head1 METHODS

=head2 new

=head2 get_min

=head2 set_min

=head2 get_max

=head2 set_max

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

