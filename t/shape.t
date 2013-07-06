use strict;
use warnings;
use Test::More;
use Chipmunk::Body;
use Chipmunk::CircleShape;
use Chipmunk::PolyShape;
use Chipmunk::SegmentShape;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );

    my %shapes;

    {
        my $body = Chipmunk::Body->new( $mass, $inertia );
        my ( $radius, $offset ) = ( 3.0, [ 4.0, 5.0 ] );
        my $circle = Chipmunk::CircleShape->new( $body, $radius, $offset );
        $shapes{circle} = $circle;
    }

    {
        my $body = Chipmunk::Body->new( $mass, $inertia );
        my ( $point_a, $point_b, $radius )
            = ( [ 3.0, 4.0 ], [ 5.0, 6.0 ], 7.0 );
        my $segment
            = Chipmunk::SegmentShape->new( $body, $point_a, $point_b,
            $radius );
        $shapes{segment} = $segment;
    }

    {
        my $body = Chipmunk::Body->new( $mass, $inertia );
        my $verts = [ [ 0, 0 ], [ 0, 1 ], [ 1, 0 ] ];
        my $poly = Chipmunk::PolyShape->new( $body, $verts );
        $shapes{poly} = $poly;
    }

    while ( my ( $type, $shape ) = each %shapes ) {

        isa_ok( $shape, 'Chipmunk::Shape', "new ($type)" );

        {
            my $bb = $shape->cache_bb();
            ok( $bb, "cache_bb ($type)" );
            isa_ok( $bb, 'Chipmunk::BB', "cache_bb ($type)" );
        }

        {
            my $bb = $shape->get_bb();
            ok( $bb, "get_bb ($type)" );
            isa_ok( $bb, 'Chipmunk::BB', "get_bb ($type)" );
        }

        my $friction = 3.0;
        $shape->set_friction($friction);
        cmp_ok( abs $shape->get_friction() - $friction,
            '<', 1e-5, "get_friction ($type)" );

        eval {
            $shape->free();
            pass("free ($type)");
            1;
        } or do {
            fail("free ($type)");
        };
    }
}

done_testing();

