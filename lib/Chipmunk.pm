package Chipmunk;

# ABSTRACT: 2D physics library

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our @EXPORT = qw(
    enable_segment_to_segment_collisions
    moment_for_circle
    area_for_circle
    moment_for_segment
    area_for_segment
    moment_for_poly
    area_for_poly
    centroid_for_poly
    recenter_poly
    moment_for_box
    moment_for_box2
    convex_hull
);

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

