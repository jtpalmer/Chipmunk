package Chipmunk::BB;

# ABSTRACT: Axis-aligned bounding box

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::BB', $Chipmunk::BB::VERSION );

1;

__END__

=head1 SYNOPSIS

    ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );

    $point = [ 10, 20 ];
    $radius = 5;
    $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );

=head1 DESCRIPTION

Chipmunk's axis-aligned 2D bounding box type. (left, bottom, right, top)

=head1 METHODS

=head2 new

=over 4

=item Arguments: $left, $bottom, $right, $top

=item Return Value: $bb

=back

    ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );

=head2 new_for_circle

=over 4

=item Arguments: L<$point|Chipmunk::Vect>, $radius

=item Return Value: L<$bb|/new>

=back

    $point = [ 10, 20 ];
    $radius = 5;
    $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );

=head2 intersects

=over 4

=item Arguments: L<$other|/new>

=item Return value: $intersects

=back

Returns true if the bounding boxes intersect.

    if ( $bb1->intersects($bb2) ) {
        print "Bounding boxes intersect\n";
    }

=head2 contains_bb

=over 4

=item Arguments: L<$other|/new>

=item Return value: $contains

=back

Returns true if the bounding box completely contains C<$other>.

    if ( $bb1->contains($bb2) ) {
        print "bb1 contains bb2\n";
    }

=head2 contains_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: $contains

=back

Returns true if the bounding box contains C<$v>.

    if ( $bb->contains_vect($v) ) {
        print "bb contains vector v\n";
    }

=head2 merge

=over 4

=item Arguments: L<$other|/new>

=item Return value: L<$merged|/new>

=back

Returns the minimal bounding box that contains both the original
bounding box and C<$other>.

    $bb3 = $bb1->merge($bb2);

=head2 expand

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$expanded|/new>

=back

Returns the minimal bounding box that contains both the original
bounding box and C<$v>.

    $bb2 = $bb1->expand($v);

=head2 area

=over 4

=item Arguments: none

=item Return value: $area

=back

Return the area of the bounding box.

    $area = $bb->area();

=head2 merged_area

=over 4

=item Arguments: L<$other|/new>

=item Return value: $area

=back

Merges the bounding box with C<$other> then returns the area of the
merged bounding box.

    $area = $bb1->merged_area($bb2);

=head2 segment_query

=over 4

=item Arguments: L<$v_a|Chipmunk::Vect>, L<$v_b|Chipmunk::Vect>

=item Return value: $fraction

=back

Returns the fraction along the segment query the bounding box is hit.
Returns L<INFINITY|Chipmunk::Math/INFINITY> if it doesn't hit.

    $fraction = $bb->segment_query( $v_a, $v_b );

=head2 intersects_segment

=over 4

=item Arguments: L<$v_a|Chipmunk::Vect>, L<$v_b|Chipmunk::Vect>

=item Return value: $intersects

=back

Returns true if the segment defined by endpoints C<$v_a> and C<$v_b>
intersect the bounding box.

    if ( $bb->intersects_segment( $v_a, $v_b ) ) {
        print "bb intersects segment\n";
    }


=head2 clamp_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$clamped|Chipmunk::Vect>

=back

Returns a copy of C<$v> clamped to the bounding box.

    $clamped = $bb->clamp_vect($v);

=head2 wrap_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$wrapped|Chipmunk::Vect>

=back

Returns a copy of C<$v> wrapped to the bounding box.

    $wrapped = $bb->wrap_vect($v);

=head1 SEE ALSO

L<Chipmunk>, L<Chipmunk::Vect>, L<Chipmunk::Shape>, L<Chipmunk::Space>

=cut

