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

=item Arguments:

=item Return Value:

=back

=head2 cpfmin

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpfabs

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpfclamp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpfclamp01

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpflerp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpflerpconst

=over 4

=item Arguments:

=item Return Value:

=back

=head2 moment_for_circle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 area_for_circle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 moment_for_segment

=over 4

=item Arguments:

=item Return Value:

=back

=head2 area_for_segment

=over 4

=item Arguments:

=item Return Value:

=back

=head2 moment_for_poly

=over 4

=item Arguments:

=item Return Value:

=back

=head2 area_for_poly

=over 4

=item Arguments:

=item Return Value:

=back

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

=item Arguments:

=item Return Value:

=back

=head2 moment_for_box2

=over 4

=item Arguments:

=item Return Value:

=back

=head2 convex_hull

=over 4

=item Arguments:

=item Return Value:

=back

=head1 SEE ALSO

L<Chipmunk::Vect>

=cut

