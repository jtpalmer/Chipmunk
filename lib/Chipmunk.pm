package Chipmunk;

# ABSTRACT: 2D physics library

use strict;
use warnings;
use Alien::Chipmunk;

use parent qw(Exporter);

our %EXPORT_TAGS = (
    all => [
        qw(
            enable_segment_to_segment_collisions
            reset_shape_id_counter
            )
    ],
);

our @EXPORT_OK = @{ $EXPORT_TAGS{all} };

our @EXPORT = qw();

require XSLoader;
XSLoader::load( 'Chipmunk', $Chipmunk::VERSION );

1;

__END__

=head1 SYNOPSIS

    use Chipmunk qw(:all);

=head1 DESCRIPTION

Perl bindings for the Chipmunk Physics library.

=head1 METHODS

=head2 enable_segment_to_segment_collisions

=over 4

=item Arguments: none

=item Return value: not defined

=back

Chipmunk didn't support segment/segment collisions until v6.1.2. For
compatibility reasons, you must explicitly and globally enable them.

    enable_segment_to_segment_collisions();

=head2 reset_shape_id_counter

=over 4

=item Arguments: none

=item Return value: not defined

=back

Chipmunk keeps a counter so that every new shape is given a unique hash
value to be used in the spatial index. Because this affects the order in
which the collisions are found and handled, you can reset the shape
counter every time you populate a space with new shapes. If you don't,
there might be (very) slight differences in the simulation.

    reset_shape_id_counter();

=head1 NOTICE

The documentation is taken from
L<Chipmunk2D|http://chipmunk-physics.net/release/ChipmunkLatest-Docs/>

Copyright (c) 2007-2013 Scott Lembcke and Howling Moon Software

=head1 SEE ALSO

L<Chipmunk2D Physics|http://chipmunk-physics.net/>, L<Alien::Chipmunk>

=cut

