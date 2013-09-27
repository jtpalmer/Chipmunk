package Chipmunk::SimpleMotor;

# ABSTRACT: Simple motor

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::SimpleMotor', $Chipmunk::SimpleMotor::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

