package Chipmunk::DampedSpring;

# ABSTRACT: Damped spring

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::DampedSpring', $Chipmunk::DampedSpring::VERSION );

1;

__END__

=head1 SYNOPSIS

    $spring = Chipmunk::DampedSpring->new( $body_a, $body_b, $anchr1,
            $anchr2, $rest_length, $stiffness, $damping );

=head1 DESCRIPTION

Defined much like a slide joint. C<$rest_length> is the distance the
spring wants to be, C<$stiffness> is the spring constant
(L<Young's modulus|http://en.wikipedia.org/wiki/Young's_modulus>), and
C<$damping> is how soft to make the damping of the spring.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body_a|Chipmunk::Body>, L<$body_a|Chipmunk::Body>, L<$anchr1|Chipmunk::Vect>, L<$anchr2|Chipmunk::Vect>, $rest_length, $stiffness, $damping 

=item Return Value: $spring

=back

    $spring = Chipmunk::DampedSpring->new( $body_a, $body_b, $anchr1,
            $anchr2, $rest_length, $stiffness, $damping );

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

