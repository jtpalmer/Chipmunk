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

=head1 METHODS

=head2 new

=head2 get_rate

=head2 set_rate

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

