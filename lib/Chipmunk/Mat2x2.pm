package Chipmunk::Mat2x2;

# ABSTRACT: 2x2 matrix type used for tensors and such

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Mat2x2', $Chipmunk::Mat2x2::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 transform

=cut

