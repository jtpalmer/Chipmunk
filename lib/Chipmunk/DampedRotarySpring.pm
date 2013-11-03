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

    my $a = Chipmunk::Body->new( 1.0, 2.0 );
    my $b = Chipmunk::Body->new( 2.0, 3.0 );
    my ( $rest_angle, $stiffness, $damping ) = ( 0.0, 1.0, 2.0 );

    my $spring
        = Chipmunk::DampedRotarySpring->new( $a, $b, $rest_angle, $stiffness,
        $damping );

=head1 DESCRIPTION

Like a damped spring, but works in an angular fashion. C<$rest_angle> is
the relative angle in radians that the bodies want to have, C<$stiffness>
and C<$damping> work basically the same as on a damped spring.

=head1 METHODS

=head2 new

    my $spring
        = Chipmunk::DampedRotarySpring->new( $a, $b, $rest_angle, $stiffness,
        $damping );

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

