use strict;
use warnings;
use Test::More;
use Chipmunk qw(:all);

eval {
    enable_segment_to_segment_collisions();
    pass('enable_segment_to_segment_collisions');
    1;
} or do {
    fail('enable_segment_to_segment_collisions');
};

eval {
    reset_shape_id_counter();
    pass('reset_shape_id_counter');
    1;
} or do {
    fail('reset_shape_id_counter');
};

done_testing();

