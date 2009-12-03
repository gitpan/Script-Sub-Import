use Test::More 'no_plan';
use strict;
use warnings;

use_ok('Script::Sub::Import', 't/03-package/t1.pl', 'Some::Package');

my $test;
sub test {$test = shift}


test 'Import subroutine';
is(Some::Package::f1(), 1, "$test 1");
