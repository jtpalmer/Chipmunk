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

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 new_for_circle

=head2 intersects

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

=cut

