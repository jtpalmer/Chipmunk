package Chipmunk::PinJoint;

# ABSTRACT: Pin joint

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Constraint);

require XSLoader;
XSLoader::load( 'Chipmunk::PinJoint', $Chipmunk::PinJoint::VERSION );

1;

__END__

=head1 SYNOPSIS

    my ( $mass, $inertia ) = ( 1.1, 2.2 );
    my $a = Chipmunk::Body->new( $mass, $inertia );
    my $b = Chipmunk::Body->new( $mass, $inertia );

    my $anchr1 = [ 3.3, 4.4 ];
    my $anchr2 = [ 5.5, 6.6 ];

    my $joint = Chipmunk::PinJoint->new( $a, $b, $anchr1, $anchr2 );

=head1 DESCRIPTION

C<$a> and C<$b> are the two bodies to connect, and C<$anchr1> and
C<$anchr2> are the anchor points on those bodies. The distance between
the two anchor points is measured when the joint is created. If you want
to set a specific distance, use the setter function to override it.

=head1 METHODS

=head2 new

    my $joint = Chipmunk::PinJoint->new( $a, $b, $anchr1, $anchr2 );

=head2 get_anchr1

=head2 set_anchr1

=head2 get_anchr2

=head2 set_anchr2

=head2 get_dist

=head2 set_dist

=head1 SEE ALSO

L<Chipmunk::Constraint>

=cut

