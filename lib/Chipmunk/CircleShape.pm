package Chipmunk::CircleShape;
use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Chipmunk::Shape);

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load( 'Chipmunk::CircleShape', $VERSION );

1;

__END__

=head1 NAME

Chipmunk::CircleShape

=head1 SYNOPSIS



=head1 DESCRIPTION



=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jeffrey T. Palmer.

This is free software, licensed under:

    The MIT License

=cut

