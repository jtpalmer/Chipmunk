package Chipmunk::Mat2x2;

# ABSTRACT: 2x2 matrix type used for tensors and such

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            transform
            )
    ],
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk::Mat2x2', $Chipmunk::Mat2x2::VERSION );

1;

__END__

