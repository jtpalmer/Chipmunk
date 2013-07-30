package Chipmunk::PivotJoint;

# ABSTRACT: Pivot joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::PivotJoint', $Chipmunk::PivotJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

