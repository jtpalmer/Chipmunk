package Chipmunk::Constraint;

# ABSTRACT: Opaque constraint

use strict;
use warnings;
use Alien::Chipmunk;

require XSLoader;
XSLoader::load( 'Chipmunk::Constraint', $Chipmunk::Constraint::VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 activate_bodies

=head2 get_space

=head2 get_a

=head2 get_b

=head2 get_max_force

=head2 set_max_force

=head2 get_error_bias

=head2 set_error_bias

=head2 get_max_bias

=head2 get_max_bias

=head2 get_user_data

=head2 set_user_data

=head2 get_impulse

=cut

