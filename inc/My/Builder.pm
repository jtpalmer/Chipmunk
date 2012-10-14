package My::Builder;
use strict;
use warnings;
use parent qw(Module::Build);
use Alien::Chipmunk;

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

