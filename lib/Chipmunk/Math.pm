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

Common math functions.

=head1 METHODS

=head2 cpfmax

=over 4

=item Arguments: $a, $b

=item Return Value: $max

=back

    $max = cpfmax( $a, $b );

=head2 cpfmin

=over 4

=item Arguments: $a, $b

=item Return Value: $min

=back

    $min = cpfmin( $a, $b );

=head2 cpfabs

=over 4

=item Arguments: $f

=item Return Value: $abs

=back

    $abs = cpfabs($f);

=head2 cpfclamp

=over 4

=item Arguments: $f, $min, $max

=item Return Value: $clamped

=back

Clamp C<$f> to be between C<$min> and C<$max>.

    $clamped = cpfclamp( $f, $min, $max );

=head2 cpfclamp01

=over 4

=item Arguments: $f

=item Return Value: $clamped

=back

Clamp C<$f> to be between zero and one.

    $clamped = cpfclamp($f);

=head2 cpflerp

=over 4

=item Arguments: $f1, $f2, $t

=item Return Value: $interpolated

=back

Linearly interpolate between C<$f1> and C<$f2>.

    $interpolated = cpflerp( $f1, $f2, $t );

=head2 cpflerpconst

=over 4

=item Arguments: $f1, $f2, $d

=item Return Value: $iterpolated

=back

Linearly interpolate from C<$f1> towards C<$f2> by no more than C<$d>.

    $interpolated = cpflerpconst( $f1, $f2, $d );

=head2 moment_for_circle

=over 4

=item Arguments: $m, $r1, $r2, L<$offset|Chipmunk::Vect>

=item Return Value: $moment

=back

Calculate the moment of inertia for a hollow circle, C<r1> and C<r2> are
the inner and outer diameters in no particular order. (A solid circle
has an inner diameter of 0)

    $moment = moment_for_circle( $m, $r1, $r2, $offset );

=head2 area_for_circle

=over 4

=item Arguments: $r1, $r2

=item Return Value: $area

=back

Area of a hollow circle.

    $area = area_for_circle( $r1, $r2 );

=head2 moment_for_segment

=over 4

=item Arguments: $m, L<$v_a|Chipmunk::Vect>, L<$v_b|Chipmunk::Vect>

=item Return Value: $moment

=back

Calculate the moment of inertia for a line segment. The endpoints
C<$v_a> and C<$v_b> are relative to the body.

    $moment = moment_for_segment( $m, $v_a, $v_b );

=head2 area_for_segment

=over 4

=item Arguments: L<$v_a|Chipmunk::Vect>, L<$v_b|Chipmunk::Vect>, $r

=item Return Value: $area

=back

Area of a beveled segment. I<(Will always be zero if radius is zero)>

    $area = area_for_segment( $v_a, $v_b, $r );

=head2 moment_for_poly

=over 4

=item Arguments: $m, L<\@verts|Chipmunk::Vect>, L<$offset?|Chipmunk::Vect>

=item Return Value: $moment

=back

Calculate the moment of inertia for a solid polygon shape assuming it's
center of gravity is at it's centroid. The offset is added to each
vertex.

    $moment = moment_for_poly( $m, $verts );
    $moment = moment_for_poly( $m, $verts, $offset );

=head2 area_for_poly

=over 4

=item Arguments: L<\@verts|Chipmunk::Vect>

=item Return Value: $area

=back

Signed area of a polygon shape. Returns a negative number for polygons
with a backwards winding.

    $area = area_for_poly($verts);

=head2 centroid_for_poly

=over 4

=item Arguments:

=item Return Value:

=back

=head2 recenter_poly

=over 4

=item Arguments:

=item Return Value:

=back

=head2 moment_for_box

=over 4

=item Arguments: $m, $width, $height

=item Return Value: $moment

=back

Calculate the moment of inertia for a solid box centered on the body.

    $moment = moment_for_box( $m, $width, $height );

=head2 moment_for_box2

=over 4

=item Arguments: $m, L<$box|Chipmunk::BB>

=item Return Value: $moment

=back

    $moment = moment_for_box2( $m, $bb );

=head2 convex_hull

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Vect>

=cut

