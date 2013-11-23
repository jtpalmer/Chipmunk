package Chipmunk::Vect;

# ABSTRACT: Handy 2D vector math lib

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            cpvslerp
            cpvslerpconst
            cpvstr
            cpveql
            cpvadd
            cpvsub
            cpvneg
            cpvmult
            cpvdot
            cpvcross
            cpvperp
            cpvrperp
            cpvproject
            cpvforangle
            cpvtoangle
            cpvrotate
            cpvunrotate
            cpvlengthsq
            cpvlength
            cpvlerp
            cpvnormalize
            cpvnormalize_safe
            cpvclamp
            cpvlerpconst
            cpvdist
            cpvdistsq
            cpvnear
            )
    ]
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk::Vect', $Chipmunk::Vect::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk::Vect qw(:all);

    $v1 = [ 1.1, 2.2 ];
    $v2 = [ 3.3, 4.4 ];

    $sum  = cpvadd( $v1, $v2 );
    $diff = cpvsub( $v1, $v2 );

=head1 DESCRIPTION

Vector functions.

=head1 FUNCTIONS

=head2 cpvslerp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvslerpconst

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvstr

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpveql

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvadd

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvsub

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvneg

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvmult

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvdot

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvcross

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvperp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvrperp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvproject

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvforangle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvtoangle

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvrotate

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvunrotate

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvlengthsq

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvlength

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvlerp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvnormalize

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvnormalize_safe

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvclamp

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvlerpconst

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvdist

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvdistsq

=over 4

=item Arguments:

=item Return Value:

=back

=head2 cpvnear

=over 4

=item Arguments:

=item Return Value:

=back

=cut

