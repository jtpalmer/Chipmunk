use strict;
use warnings;
use Module::Build;
use Alien::Chipmunk;

my $alien = Alien::Chipmunk->new();

my $builder = Module::Build->new(
    module_name        => 'Chipmunk',
    dist_abstract      => 'Chipmunk Physics library',
    license            => 'mit',
    dist_author        => 'Jeffrey T. Palmer <jtpalmer@cpan.org>',
    dist_version_from  => 'lib/Chipmunk.pm',
    configure_requires => {
        'Module::Build'   => 0,
        'Alien::Chipmunk' => 0,
    },
    build_requires => {
        'Test::More'      => 0,
        'Alien::Chipmunk' => 0,
    },
    requires => {
        'perl'   => '5.8.1',
        'parent' => 0,
    },
    c_source             => 'src',
    extra_compiler_flags => $alien->cflags,
    extra_linker_flags   => $alien->libs . ' -lm',
);

$builder->create_build_script();

