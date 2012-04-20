package Chipmunk;
use 5.008001;
use strict;
use warnings;
use Alien::Chipmunk;

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load('Chipmunk', $VERSION);

1;
