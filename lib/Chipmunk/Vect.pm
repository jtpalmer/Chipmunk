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

    my $v1 = [ 1.1, 2.2 ];
    my $v2 = [ 3.3, 4.4 ];

    my $sum  = cpvadd( $v1, $v2 );
    my $diff = cpvsub( $v1, $v2 );

=head1 DESCRIPTION

Vector functions.

=head1 FUNCTIONS

=head2 cpvslerp

=head2 cpvslerpconst

=head2 cpvstr

=head2 cpveql

=head2 cpvadd

=head2 cpvsub

=head2 cpvneg

=head2 cpvmult

=head2 cpvdot

=head2 cpvcross

=head2 cpvperp

=head2 cpvrperp

=head2 cpvproject

=head2 cpvforangle

=head2 cpvtoangle

=head2 cpvrotate

=head2 cpvunrotate

=head2 cpvlengthsq

=head2 cpvlength

=head2 cpvlerp

=head2 cpvnormalize

=head2 cpvnormalize_safe

=head2 cpvclamp

=head2 cpvlerpconst

=head2 cpvdist

=head2 cpvdistsq

=head2 cpvnear

=cut

