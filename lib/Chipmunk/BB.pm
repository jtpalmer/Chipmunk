package Chipmunk::BB;

# ABSTRACT: Axis-aligned bounding box

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::BB', $Chipmunk::BB::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

