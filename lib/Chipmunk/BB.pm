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

    if ( $bb1->intersects($bb2) ) {
        print "Bounding boxes intersect\n";
    }

=head2 contains_bb

=over 4

=item Arguments: L<$other|/new>

=item Return value: $contains

=back

=head2 contains_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: $contains

=back

=head2 merge

=over 4

=item Arguments: L<$other|/new>

=item Return value: L<$merged|/new>

=back

=head2 expand

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$expanded|/new>

=back

=head2 area

=over 4

=item Arguments: none

=item Return value: $area

=back

=head2 merged_area

=over 4

=item Arguments: L<$other|/new>

=item Return value: $area

=back

=head2 segment_query

=over 4

=item Arguments: L<$a|Chipmunk::Vect>, L<$b|Chipmunk::Vect>

=item Return value: $length

=back

=head2 intersects_segment

=over 4

=item Arguments: L<$a|Chipmunk::Vect>, L<$b|Chipmunk::Vect>

=item Return value: $intersects

=back

=head2 clamp_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$clamped|Chipmunk::Vect>

=back

=head2 wrap_vect

=over 4

=item Arguments: L<$v|Chipmunk::Vect>

=item Return value: L<$wrapped|Chipmunk::Vect>

=back

=head1 SEE ALSO

L<Chipmunk>, L<Chipmunk::Vect>, L<Chipmunk::Shape>, L<Chipmunk::Space>

=cut

