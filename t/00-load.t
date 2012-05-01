#!perl -T
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok 'Chipmunk'        or BAIL_OUT('Failed to load Chipmunk!');
    use_ok 'Chipmunk::Space' or BAIL_OUT('Failed to load Chipmunk::Space!');
    use_ok 'Chipmunk::Shape' or BAIL_OUT('Failed to load Chipmunk::Shape!');
    use_ok 'Chipmunk::Body'  or BAIL_OUT('Failed to load Chipmunk::Body!');
    use_ok 'Chipmunk::PolyShape'
        or BAIL_OUT('Failed to load Chipmunk::PolyShape!');
}

diag "Testing Chipmunk $Chipmunk::VERSION, Perl $], $^X";

done_testing();

