use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Chipmunk
        Chipmunk::Body
        Chipmunk::CircleShape
        Chipmunk::PolyShape
        Chipmunk::SegmentShape
        Chipmunk::Shape
        Chipmunk::Space
    );

    for my $module (@modules) {
        use_ok($module) or BAIL_OUT("Failed to load $module");
    }
}

diag(
    sprintf(
        'Testing Chipmunk %f, Perl %f, %s', $Chipmunk::VERSION, $], $^X
    )
);

done_testing();

