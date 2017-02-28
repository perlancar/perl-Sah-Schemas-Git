#!perl

use 5.010001;
use strict;
use warnings;

use Test::More 0.98;
use Test::Needs;

subtest "validation" => sub {
    test_needs 'Data::Sah';

    my $v = Data::Sah::gen_validator("git::refname*");

    ok(!$v->("a"), "no slash -> nok");
    ok(!$v->(".a"), "starts with a dot -> nok");
    ok(!$v->("tags/.a"), "starts with a dot -> nok (2)");
};

done_testing;
