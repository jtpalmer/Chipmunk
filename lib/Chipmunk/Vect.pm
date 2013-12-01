package Chipmunk::Vect;

# ABSTRACT: Handy 2D vector math lib

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            cpvslerp
            cpvslerpconst
            cpvstr
            cpveql
            cpvadd
            cpvsub
            cpvneg
            cpvmult
            cpvdot
            cpvcross
            cpvperp
            cpvrperp
            cpvproject
            cpvforangle
            cpvtoangle
            cpvrotate
            cpvunrotate
            cpvlengthsq
            cpvlength
            cpvlerp
            cpvnormalize
            cpvnormalize_safe
            cpvclamp
            cpvlerpconst
            cpvdist
            cpvdistsq
            cpvnear
            )
    ]
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk::Vect', $Chipmunk::Vect::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk::Vect qw(:all);

    $v1 = [ 1.1, 2.2 ];
    $v2 = [ 3.3, 4.4 ];

    $sum  = cpvadd( $v1, $v2 );
    $diff = cpvsub( $v1, $v2 );

=head1 DESCRIPTION

Vector functions.

=head1 FUNCTIONS

=head2 cpvslerp

=over 4

=item Arguments:

=item Return Value:

=back

Spherical linearly interpolate between C<$v1> and C<$v2>.

=head2 cpvslerpconst

=over 4

=item Arguments:

=item Return Value:

=back

Spherical linearly interpolate between C<$v1> towards C<$v2> by no more
than angle C<$a> in radians.

=head2 cpvstr

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpveql

=over 4

=item Arguments: $v1, $v2

=item Return Value: $equal

=back

Check if two vectors are equal.

I<(Be careful when comparing floating point numbers!)>

=head2 cpvadd

=over 4

=item Arguments:

=item Return Value:

=back

Add two vectors.

=head2 cpvsub

=over 4

=item Arguments:

=item Return Value:

=back

Subtract two vectors.

=head2 cpvneg

=over 4

=item Arguments:

=item Return Value:

=back

Negate a vector.

=head2 cpvmult

=over 4

=item Arguments:

=item Return Value:

=back

Scalar multiplication.

=head2 cpvdot

=over 4

=item Arguments:

=item Return Value:

=back

Vector dot product.

=head2 cpvcross

=over 4

=item Arguments:

=item Return Value:

=back

2D vector cross product analog. The cross product of 2D vectors results
in a 3D vector with only a z component. This function returns the value
along the z-axis.

=head2 cpvperp

=over 4

=item Arguments:

=item Return Value:

=back

Returns a perpendicular vector. (90 degree rotation)

=head2 cpvrperp

=over 4

=item Arguments:

=item Return Value:

=back

Returns a perpendicular vector. (-90 degree rotation)

=head2 cpvproject

=over 4

=item Arguments:

=item Return Value:

=back

Returns the vector projection of C<$v1> onto C<$v2>.

=head2 cpvforangle

=over 4

=item Arguments:

=item Return Value:

=back

Returns the unit length vector for the given angle (in radians).

=head2 cpvtoangle

=over 4

=item Arguments:

=item Return Value:

=back

Returns the angular direction C<$v> is pointing in (in radians).

=head2 cpvrotate

=over 4

=item Arguments:

=item Return Value:

=back

Uses complex multiplication to rotate C<$v1> by C<$v2>. Scaling will
occur if C<$v1> is not a unit vector.

=head2 cpvunrotate

=over 4

=item Arguments:

=item Return Value:

=back

Inverse of L</cpvrotate>.

=head2 cpvlengthsq

=over 4

=item Arguments:

=item Return Value:

=back

Returns the squared length of C<$v>. Faster than L</cpvlength> when you
only need to compare lengths.

=head2 cpvlength

=over 4

=item Arguments:

=item Return Value:

=back

Returns the length of C<$v>.

=head2 cpvlerp

=over 4

=item Arguments:

=item Return Value:

=back

Linearly interpolate between C<$v1> and C<$v2>.

=head2 cpvnormalize

=over 4

=item Arguments:

=item Return Value:

=back

Returns a normalized copy of C<$v>. As a special case, it returns
C<cpvzero> when called on C<cpvzero>.

=head2 cpvnormalize_safe

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvclamp

=over 4

=item Arguments:

=item Return Value:

=back

Clamp C<$v> to length C<$len>.

=head2 cpvlerpconst

=over 4

=item Arguments:

=item Return Value:

=back

Linearly interpolate between C<$v1> towards C<$v2> by distance C<$d>.

=head2 cpvdist

=over 4

=item Arguments:

=item Return Value:

=back

Returns the distance between C<$v1> and C<$v2>.

=head2 cpvdistsq

=over 4

=item Arguments:

=item Return Value:

=back

Returns the squared distance between C<$v1> and C<$v2>. Faster than
L</cpvdist> when you only need to compare distances.

=head2 cpvnear

=over 4

=item Arguments:

=item Return Value:

=back

Returns true if the distance between C<$v1> and C<$v2> is less than
C<$dist>.

=cut

