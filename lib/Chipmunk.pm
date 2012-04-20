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

__END__

=head1 NAME

Chipmunk - Perl bindings for the Chipmunk Physics library

=head1 SYNOPSIS

    use Chipmunk;

=head1 DESCRIPTION

Perl bindings for the Chipmunk Physics library.

=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Jeffrey Palmer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut

