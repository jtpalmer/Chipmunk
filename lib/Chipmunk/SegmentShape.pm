package Chipmunk::SegmentShape;

# ABSTRACT: Segment shape

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::SegmentShape', $Chipmunk::SegmentShape::VERSION );

1;

__END__

=head1 SYNOPSIS

    $segment
        = Chipmunk::SegmentShape->new( $body, $point_a, $point_b, $radius );

=head1 DESCRIPTION

Meant mainly as a static shape. Can be beveled in order to give them a
thickness.

=head1 METHODS

=head2 new

L<$body> is the body to attach the segment to, L<$point_a> and
L<$point_b> are the endpoints, and L<$radius> is the thickness of the
segment.

=head2 set_neighbors

When you have a number of segment shapes that are all joined together,
things can still collide with the "cracks" between the segments. By
setting the neighbor segment endpoints you can tell Chipmunk to avoid
colliding with the inner parts of the crack.

=head2 get_a

=head2 get_b

=head2 get_normal

=head2 get_radius

=head1 SEE ALSO

L<Chipmunk::Shape>

=cut

