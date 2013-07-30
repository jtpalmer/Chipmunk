package Chipmunk::SlideJoint;

# ABSTRACT: Slide joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::SlideJoint', $Chipmunk::SlideJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

