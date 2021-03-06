package Chipmunk::CircleShape;

# ABSTRACT: Circle shape

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::CircleShape', $Chipmunk::CircleShape::VERSION );

1;

__END__

=head1 SYNOPSIS

    $circle = Chipmunk::CircleShape->new( $body, $radius, $offset );

=head1 DESCRIPTION

Fastest and simplest collision shape.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body|Chipmunk::Body>, $radius, L<$offset|Chipmunk::Vect>

=item Return Value: $circle

=back

L<$body> is the body to attach the circle to, L<$offset> is the offset
from the body's center of gravity in body local coordinates.

    $circle = Chipmunk::CircleShape->new( $body, $radius, $offset );

=head2 get_offset

=over 4

=item Arguments: none

=item Return Value: L<$offset|Chipmunk::Vect>

=back

Get circle offset.

    $offset = $circle->get_offset();

=head2 get_radius

=over 4

=item Arguments: none

=item Return Value: $radius

=back

Get circle radius.

    $radius = $circle->get_radius();

=head1 SEE ALSO

L<Chipmunk::Shape>

=cut

