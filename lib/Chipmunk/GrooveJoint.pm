package Chipmunk::GrooveJoint;

# ABSTRACT: Groove joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::GrooveJoint', $Chipmunk::GrooveJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

    $joint = Chipmunk::GrooveJoint->new( $body_a, $body_b, $groove_a,
        $groove_b, $anchr2 );
    $space->add_constraint($joint);

=head1 DESCRIPTION

The groove goes from C<$groove_a> to C<$groove_b> on body C<$a>, and the
pivot is attached to C<$anchr2> on body C<$b>. All coordinates are body
local.

=head1 METHODS

=head2 new

=over 4

=item Arguments: L<$body_a|Chipmunk::Body>, L<$body_b|Chipmunk::Body>, L<$groove_a|Chipmunk::Vect>, L<$groove_b|Chipmunk::Vect>, L<$anchr2|Chipmunk::Vect>

=item Return Value: $joint

=back

=head2 get_groove_a

=over 4

=item Arguments: none

=item Return Value: L<$groove_a|Chipmunk::Vect>

=back

=head2 set_groove_a

=over 4

=item Arguments: L<$groove_a|Chipmunk::Vect>

=item Return Value: not defined

=back

=head2 get_groove_b

=over 4

=item Arguments: none

=item Return Value: L<$groove_b|Chipmunk::Vect>

=back

=head2 set_groove_b

=over 4

=item Arguments: L<$groove_b|Chipmunk::Vect>

=item Return Value: not defined

=back

=head2 get_anchr2

=over 4

=item Arguments: none

=item Return Value: L<$anchr2|Chipmunk::Vect>

=back

=head2 set_anchr2

=over 4

=item Arguments: L<$anchr2|Chipmunk::Vect>

=item Return Value: not defined

=back

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

