#!perl -T
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok 'Chipmunk' or BAIL_OUT('Load failed!');
}

diag "Testing Chipmunk $Chipmunk::VERSION, Perl $], $^X";

done_testing();

