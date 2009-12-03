use Test::More 'no_plan';
use strict;
use warnings;

use_ok('Script::Sub::Import', 't/01-core/t1.pl');

my $test;
sub test {$test = shift}


test 'Import subroutine';
is(f1(), 1, "$test 1");
