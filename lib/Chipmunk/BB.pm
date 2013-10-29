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

    my ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    my $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );

    my ( $point, $radius ) = ( [ 10, 20 ], 5 );
    my $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );

=head1 DESCRIPTION

Chipmunk's axis-aligned 2D bounding box type. (left, bottom, right, top)

=head1 METHODS

=head2 new

    my ( $left, $bottom, $right, $top ) = ( 0, 10, 20, 30 );
    my $bb = Chipmunk::BB->new( $left, $bottom, $right, $top );

=head2 new_for_circle

    my ( $point, $radius ) = ( [ 10, 20 ], 5 );
    my $circle_bb = Chipmunk::BB->new_for_circle( $point, $radius );

=head2 intersects

    if ( $bb1->intersects($bb2) ) {
        print "Bounding boxes intersect\n";
    }

=head2 contains_bb

=head2 contains_vect

=head2 merge

=head2 expand

=head2 area

=head2 merged_area

=head2 segment_query

=head2 intersects_segment

=head2 clamp_vect

=head2 wrap_vect

=head1 SEE ALSO

L<Chipmunk>, L<Chipmunk::Shape>, L<Chipmunk::Space>

=cut

