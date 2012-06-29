package Chipmunk::Shape;

# ABSTRACT: Defines the shape of a rigid body

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Shape', $VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

