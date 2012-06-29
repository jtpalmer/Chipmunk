package Chipmunk::CircleShape;
use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::CircleShape', $VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

