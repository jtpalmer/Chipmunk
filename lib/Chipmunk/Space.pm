package Chipmunk::Space;

# ABSTRACT: Basic unit of simulation in Chipmunk

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Space', $Chipmunk::Space::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk::Space;
    my $space = Chipmunk::Space->new();
    $space->set_gravity([ 0, -10 ]);

=head1 DESCRIPTION

A C<Chipmunk::Space> is the basic unit of simulation in Chipmunk
Physics.

=cut

