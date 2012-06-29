package Chipmunk::PolyShape;
use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::PolyShape', $VERSION );

1;

__END__

=head1 NAME

Chipmunk::PolyShape

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jeffrey T. Palmer.

This is free software, licensed under:

  The MIT (X11) License

=cut

