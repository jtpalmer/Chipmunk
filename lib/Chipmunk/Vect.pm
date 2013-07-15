package Chipmunk::Vect;

# ABSTRACT: 2D vector type along with a handy 2D vector math lib

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            cpvslerp
            cpvstr
            cpveql
            cpvadd
            cpvsub
            cpvneg
            cpvlerp
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

=head1 DESCRIPTION

=head1 FUNCTIONS

=cut

