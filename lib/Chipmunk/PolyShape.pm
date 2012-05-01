package Chipmunk::PolyShape;
use 5.008001;
use strict;
use warnings;
use Alien::Chipmunk;

use base qw(Chipmunk::Shape);

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load('Chipmunk::PolyShape', $VERSION);

1;

__END__

=head1 NAME



=head1 SYNOPSIS



=head1 DESCRIPTION



=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Jeffrey Palmer

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

