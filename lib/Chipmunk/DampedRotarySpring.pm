package Chipmunk::DampedRotarySpring;

# ABSTRACT: Damped rotary spring

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::DampedRotarySpring',
    $Chipmunk::DampedRotarySpring::VERSION );

1;

__END__

=head1 SYNOPSIS

    my $spring
        = Chipmunk::DampedRotarySpring->new( $a, $b, $rest_angle,
        $stiffness, $damping );
    $space->add_constraint($spring);

=head1 DESCRIPTION

Like a damped spring, but works in an angular fashion. C<$rest_angle> is
the relative angle in radians that the bodies want to have, C<$stiffness>
and C<$damping> work basically the same as on a damped spring.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$a|Chipmunk::Body>, L<$b|Chipmunk::Body>, $rest_angle, $stiffness, $damping

=item Return Value: $spring

=back

    my $spring
        = Chipmunk::DampedRotarySpring->new( $a, $b, $rest_angle,
        $stiffness, $damping );

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

