package Chipmunk::Math;

# ABSTRACT: Chipmunk math functions

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
    circle => [
        qw(
            moment_for_circle
            area_for_circle
            )
    ],
    segment => [
        qw(
            moment_for_segment
            area_for_segment
            )
    ],
    poly => [
        qw(
            moment_for_poly
            area_for_poly
            centroid_for_poly
            recenter_poly
            )
    ],
    box => [
        qw(
            moment_for_box
            moment_for_box2
            )
    ],
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk::Math', $Chipmunk::Math::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk::Math qw(:all);

=head1 DESCRIPTION

=head1 METHODS

=head2 cpfmax

=head2 cpfmin

=head2 cpfabs

=head2 cpfclamp

=head2 cpfclamp01

=head2 cpflerp

=head2 cpflerpconst

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

L<Chipmunk::Vect>

=cut

