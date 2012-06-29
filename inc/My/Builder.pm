package My::Builder;
use strict;
use warnings;
use Alien::Chipmunk;
use base qw(Module::Build);

sub new {
    my $class = shift;

    $class = ref $class if ref $class;

    my $alien = Alien::Chipmunk->new();

    return $class->SUPER::new(
        @_,
        c_source             => 'src',
        extra_compiler_flags => $alien->cflags,
        extra_linker_flags   => $alien->libs . ' -lm',
    );
}

1;

