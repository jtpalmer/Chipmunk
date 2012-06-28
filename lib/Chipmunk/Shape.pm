package Chipmunk::Shape;
use strict;
use warnings;
use Alien::Chipmunk;

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load( 'Chipmunk::Shape', $VERSION );

1;

__END__

=head1 NAME

Chipmunk::Shape

=head1 SYNOPSIS



=head1 DESCRIPTION



=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jeffrey T. Palmer.

This is free software, licensed under:

  The MIT (X11) License

=cut

