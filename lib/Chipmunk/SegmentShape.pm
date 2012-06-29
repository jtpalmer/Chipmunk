package Chipmunk::SegmentShape;
use strict;
use warnings;
use Alien::Chipmunk;

use base qw(Chipmunk::Shape);

require XSLoader;
XSLoader::load( 'Chipmunk::SegmentShape', $VERSION );

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Jeffrey T. Palmer.

This is free software, licensed under:

  The MIT (X11) License

=cut

