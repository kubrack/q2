use strict;
use warnings;

use Test::More tests => 14;
use q2t;

my $obj1 = q2t->new({first => 11, second => 12});
my $obj2 = q2t->new({first => 21, second => 22});

is($obj1->first(), 11, 'init via new()');
is($obj2->first(), 21, 'init via new()');
is($obj1->second(), 12, 'init via new()');
is($obj2->second(), 22, 'init via new()');

is($obj1->third(), undef, 'default');
is($obj2->third(), undef, 'default');

$obj1->second(122);
$obj2->second(222);
$obj1->third('133 test');
$obj2->third('233 test');

is($obj1->second(), 122, 'mutator');
is($obj2->second(), 222, 'mutator');
is($obj1->third(), '133 test', 'mutator');
is($obj2->third(), '233 test', 'mutator');

is($obj1->first(), 11, 'index');
$obj1->second(undef);
is($obj1->second(), undef, 'undef setter');
is($obj2->second(), 222, 'undef setter');

eval {q2t->mk_accessors('fourth')};
ok($@, $@);


