use strict;
use warnings;
use Test::More;

BEGIN {
    unless ( $ENV{RELEASE_TESTING} ) {
        require Test::More;
        Test::More::plan(
            skip_all => 'these tests are for release candidate testing' );
    }
}

eval 'use Test::EOL';
plan skip_all => 'Test::EOL required' if $@;

all_perl_files_ok( { trailing_whitespace => 1 } );

