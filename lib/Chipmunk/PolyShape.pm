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

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 get_num_verts

=head2 get_vert

=cut

