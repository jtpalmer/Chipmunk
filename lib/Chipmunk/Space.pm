package Chipmunk::Space;
use 5.008001;
use strict;
use warnings;
use Alien::Chipmunk;

our $VERSION = '0.000001';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load('Chipmunk::Space', $VERSION);

1;

__END__

=head1 NAME

Chipmunk::Space - The basic unit of simulation

=head1 SYNOPSIS

    use Chipmunk::Space;
    my $space = Chipmunk::Space->new();
    $space->set_gravity([ 0, -10 ]);

=head1 DESCRIPTION

A C<Chipmunk::Space> is the basic unit of simulation in Chipmunk
Physics.

=head1 AUTHOR

Jeffrey T. Palmer, E<lt>jtpalmer@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Jeffrey Palmer

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

