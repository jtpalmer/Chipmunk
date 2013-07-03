use strict;
use warnings;
use Test::More;
use Math::Trig qw(:pi);
use Chipmunk::Body;
use Chipmunk::Space;

{
    my ( $mass, $inertia ) = ( 1.0, 2.0 );

    my $body = Chipmunk::Body->new( $mass, $inertia );
    isa_ok( $body, 'Chipmunk::Body', 'new' );

    ok( !$body->is_static(), 'is_static (not static)' );

    ok( $body->is_rogue(), 'is_roque' );

    my $space = Chipmunk::Space->new();
    $space->add_body($body);

    ok( !$body->is_rogue(), 'is_roque (not rogue)' );

    $body->sleep();
    ok( $body->is_sleeping(), 'is_sleeping' );

    $body->activate();
    ok( !$body->is_sleeping(), 'is_sleeping (not sleeping)' );

    isa_ok( $body->get_space(), 'Chipmunk::Space', 'get_space' );

    cmp_ok( abs $body->get_mass() - $mass, '<', 1e-5, 'get_mass' );

    $mass = 3.0;
    $body->set_mass($mass);
    cmp_ok( abs $body->get_mass() - $mass, '<', 1e-5, 'set_mass' );

    cmp_ok( abs $body->get_moment() - $inertia, '<', 1e-5, 'get_moment' );

    $inertia = 3.0;
    $body->set_moment($inertia);
    cmp_ok( abs $body->get_moment() - $inertia, '<', 1e-5, 'set_moment' );

    cmp_ok( abs $body->get_pos()->[0] - 0.0, '<', 1e-5, 'get_pos x' );
    cmp_ok( abs $body->get_pos()->[1] - 0.0, '<', 1e-5, 'get_pos y' );

    my $pos = [ 5.0, 6.0 ];
    $body->set_pos($pos);
    cmp_ok( abs $body->get_pos()->[0] - $pos->[0], '<', 1e-5, 'set_pos x' );
    cmp_ok( abs $body->get_pos()->[1] - $pos->[1], '<', 1e-5, 'set_pos y' );

    cmp_ok( abs $body->get_vel()->[0] - 0.0, '<', 1e-5, 'get_vel x' );
    cmp_ok( abs $body->get_vel()->[1] - 0.0, '<', 1e-5, 'get_vel y' );

    my $vel = [ 7.0, 8.0 ];
    $body->set_vel($vel);
    cmp_ok( abs $body->get_vel()->[0] - $vel->[0], '<', 1e-5, 'set_vel x' );
    cmp_ok( abs $body->get_vel()->[1] - $vel->[1], '<', 1e-5, 'set_vel y' );

    cmp_ok( abs $body->get_force()->[0] - 0.0, '<', 1e-5, 'get_force x' );
    cmp_ok( abs $body->get_force()->[1] - 0.0, '<', 1e-5, 'get_force y' );

    my $force = [ 9.0, 10.0 ];
    $body->set_force($force);
    cmp_ok( abs $body->get_force()->[0] - $force->[0],
        '<', 1e-5, 'set_force x' );
    cmp_ok( abs $body->get_force()->[1] - $force->[1],
        '<', 1e-5, 'set_force y' );

    cmp_ok( abs $body->get_angle() - 0.0, '<', 1e-5, 'get_angle' );

    my $angle = 1.1;
    $body->set_angle($angle);
    cmp_ok( abs $body->get_angle() - $angle, '<', 1e-5, 'set_angle' );

    cmp_ok( abs $body->get_ang_vel() - 0.0, '<', 1e-5, 'get_ang_vel' );

    my $ang_vel = 12.0;
    $body->set_ang_vel($ang_vel);
    cmp_ok( abs $body->get_ang_vel() - $ang_vel, '<', 1e-5, 'set_ang_vel' );

    cmp_ok( abs $body->get_torque() - 0.0, '<', 1e-5, 'get_torque' );

    my $torque = 13.0;
    $body->set_torque($torque);
    cmp_ok( abs $body->get_torque() - $torque, '<', 1e-5, 'set_torque' );

    $body->set_angle(0.0);
    cmp_ok( abs $body->get_rot()->[0] - 1.0, '<', 1e-5, 'get_rot x' );
    cmp_ok( abs $body->get_rot()->[1] - 0.0, '<', 1e-5, 'get_rot y' );

    $body->set_angle( pi / 2.0 );
    cmp_ok( abs $body->get_rot()->[0] - 0.0, '<', 1e-5, 'get_rot x (pi/2)' );
    cmp_ok( abs $body->get_rot()->[1] - 1.0, '<', 1e-5, 'get_rot y (pi/2)' );

    my $vel_limit = 100.0;
    $body->set_vel_limit($vel_limit);
    cmp_ok( abs $body->get_vel_limit() - $vel_limit,
        '<', 1e-5, 'set_vel_limit' );

    my $ang_vel_limit = 101.0;
    $body->set_ang_vel_limit($ang_vel_limit);
    cmp_ok( abs $body->get_ang_vel_limit() - $ang_vel_limit,
        '<', 1e-5, 'set_ang_vel_limit' );

    eval {
        $body->free();
        pass('free');
        1;
    } or do {
        fail('free');
    };
}

{
    my $body = Chipmunk::Body->new_static();
    isa_ok( $body, 'Chipmunk::Body', 'new_static' );

    ok( $body->is_static(), 'is_static' );

    eval {
        $body->free();
        pass('free (static)');
        1;
    } or do {
        fail('free (static)');
    };
}

done_testing();

