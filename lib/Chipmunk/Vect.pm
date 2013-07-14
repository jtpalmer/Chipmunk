package Chipmunk::Vect;

# ABSTRACT: 2D vector type along with a handy 2D vector math lib

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

require XSLoader;
XSLoader::load( 'Chipmunk::Vect', $Chipmunk::Vect::VERSION );

our @EXPORT = qw(
    cpvslerp
    cpvlerp
);

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

