use Test::More 'no_plan';
use strict;
use warnings;


my $test;
sub test {$test = shift}


test 'Import error';
eval "use Script::Sub::Import 't/02-error/t2.pl'";
ok($@, $test);
