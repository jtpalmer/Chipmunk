use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Chipmunk
        Chipmunk::Arbiter
        Chipmunk::BB
        Chipmunk::Body
        Chipmunk::CircleShape
        Chipmunk::Constraint
        Chipmunk::DampedRotarySpring
        Chipmunk::DampedSpring
        Chipmunk::GearJoint
        Chipmunk::GrooveJoint
        Chipmunk::Mat2x2
        Chipmunk::Math
        Chipmunk::PinJoint
        Chipmunk::PivotJoint
        Chipmunk::PolyShape
        Chipmunk::RatchetJoint
        Chipmunk::RotaryLimitJoint
        Chipmunk::SegmentShape
        Chipmunk::Shape
        Chipmunk::SimpleMotor
        Chipmunk::SlideJoint
        Chipmunk::Space
        Chipmunk::Vect
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

