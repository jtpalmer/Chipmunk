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

=head1 SEE ALSO

=over

=item * L<Chipmunk2D Physics|http://chipmunk-physics.net/>

=item * L<Alien::Chipmunk>

=back

=cut

