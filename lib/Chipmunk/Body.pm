package Chipmunk::Body;

# ABSTRACT: Rigid body type

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Body', $Chipmunk::Body::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

