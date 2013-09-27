package Chipmunk::DampedSpring;

# ABSTRACT: Damped spring

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::DampedSpring', $Chipmunk::DampedSpring::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

