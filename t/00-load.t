#!perl -T
use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Chipmunk
        Chipmunk::Body
        Chipmunk::PolyShape
        Chipmunk::Shape
        Chipmunk::Space
    );

    for my $module (@modules) {
        use_ok($module) or BAIL_OUT("Failed to load $module");
    }
}

diag "Testing Chipmunk $Chipmunk::VERSION, Perl $], $^X";

done_testing();

