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

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 set_neighbors

=head2 get_a

=head2 get_b

=head2 get_normal

=head2 get_radius

=head1 SEE ALSO

L<Chipmunk::Shape>

=cut

