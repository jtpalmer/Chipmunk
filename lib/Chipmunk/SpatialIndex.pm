package Chipmunk::SpatialIndex;

# ABSTRACT: Used to accelerate collision detection and spatial queries

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::SpatialIndex', $VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

