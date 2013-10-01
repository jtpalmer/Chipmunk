package Chipmunk::SegmentShape;

# ABSTRACT: Segment shape

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::SegmentShape', $Chipmunk::SegmentShape::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

