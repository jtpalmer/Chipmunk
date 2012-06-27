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

eval 'use Test::NoTabs';
plan skip_all => 'Test::NoTabs required' if $@;

all_perl_files_ok();

