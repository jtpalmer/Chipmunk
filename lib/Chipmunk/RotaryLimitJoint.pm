package Chipmunk::RotaryLimitJoint;

# ABSTRACT: Rotary limit joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::RotaryLimitJoint',
    $Chipmunk::RotaryLimitJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

