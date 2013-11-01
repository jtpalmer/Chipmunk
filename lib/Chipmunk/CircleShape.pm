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

=head1 DESCRIPTION

=head1 METHODS

=head2 get_offset

=head2 get_radius

=head1 SEE ALSO

L<Chipmunk::Shape>

=cut

