package Chipmunk::PolyShape;

# ABSTRACT: Polygon shape

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::PolyShape', $Chipmunk::PolyShape::VERSION );

1;

__END__

=head1 SYNOPSIS

    $body = Chipmunk::Body->new( $mass, $inertia );
    $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];
    $poly = Chipmunk::PolyShape->new( $body, $verts );

=head1 DESCRIPTION

Slowest, but most flexible collision shape.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body|Chipmunk::Body>, L<\@verts|Chipmunk::Vect>

=item Return Value: $poly

=back

    $body = Chipmunk::Body->new( $mass, $inertia );
    $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];
    $poly = Chipmunk::PolyShape->new( $body, $verts );

=head2 get_num_verts

=over 4

=item Arguments: none

=item Return Value: $num_verts

=back

    $num_verts = $poly->get_num_verts();

=head2 get_vert

=over 4

=item Arguments: $index

=item Return Value: L<$vert|Chipmunk::Vect>

=back

    $vert = $poly->get_vert($index);

=head1 SEE ALSO

L<Chipmunk::Shape>

=cut

