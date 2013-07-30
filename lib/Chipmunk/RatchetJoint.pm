package Chipmunk::RatchetJoint;

# ABSTRACT: Ratchet joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::RatchetJoint', $Chipmunk::RatchetJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

