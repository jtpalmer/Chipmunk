package Chipmunk;

# ABSTRACT: 2D physics library

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            cpfmax
            cpfmin
            cpfabs
            cpfclamp
            cpfclamp01
            cpflerp
            cpflerpconst
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
            reset_shape_id_counter
            )
    ],
    cpf => [
        qw(
            cpfmax
            cpfmin
            cpfabs
            cpfclamp
            cpfclamp01
            cpflerp
            cpflerpconst
            )
    ],
    moment => [
        qw(
            moment_for_circle
            moment_for_segment
            moment_for_poly
            moment_for_box
            moment_for_box2
            )
    ],
    area => [
        qw(
            area_for_circle
            area_for_segment
            area_for_poly
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

    use Chipmunk;

=head1 DESCRIPTION

Perl bindings for the Chipmunk Physics library.

=head1 METHODS

=head2 cpfmax

=head2 cpfmin

=head2 cpfabs

=head2 cpfclamp

=head2 cpfclamp01

=head2 cpflerp

=head2 cpflerpconst

=head2 segment_to_segment_collisions

=head2 moment_for_circle

=head2 area_for_circle

=head2 moment_for_segment

=head2 area_for_segment

=head2 moment_for_poly

=head2 area_for_poly

=head2 centroid_for_poly

=head2 recenter_poly

=head2 moment_for_box

=head2 moment_for_box2

=head2 convex_hull

=head1 SEE ALSO

=over

=item * L<Chipmunk2D Physics|http://chipmunk-physics.net/>

=item * L<Alien::Chipmunk>

=back

=cut

