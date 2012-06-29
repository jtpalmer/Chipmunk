package Chipmunk;

# ABSTRACT: 2D physics library

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk', $Chipmunk::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk;

=head1 DESCRIPTION

Perl bindings for the Chipmunk Physics library.

=cut

