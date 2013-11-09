package Chipmunk;

# ABSTRACT: 2D physics library

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            enable_segment_to_segment_collisions
            reset_shape_id_counter
            )
    ],
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk', $Chipmunk::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk qw(:all);

=head1 DESCRIPTION

Perl bindings for the Chipmunk Physics library.

=head1 METHODS

=head2 segment_to_segment_collisions

=head2 reset_shape_id_counter

=head1 SEE ALSO

L<Chipmunk2D Physics|http://chipmunk-physics.net/>, L<Alien::Chipmunk>

=cut

