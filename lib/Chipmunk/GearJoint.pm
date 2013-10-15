package Chipmunk::GearJoint;

# ABSTRACT: Gear joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::GearJoint', $Chipmunk::GearJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head2 get_phase

=head2 set_phase

=head2 get_ratio

=head2 set_ratio

=cut

