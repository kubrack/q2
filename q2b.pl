use strict;
use warnings;

use Benchmark qw(cmpthese);;
use q2;
use Class::Accessor;
use Class::Accessor::Fast;
use Class::Accessor::Faster;

q2->mk_accessors(qw(first second third));
Class::Accessor->mk_accessors(qw(first second third));
Class::Accessor::Fast->mk_accessors(qw(first second third));
Class::Accessor::Faster->mk_accessors(qw(first second third));

my $q2t = q2->new({first => 11, second => 12});
my $ca = Class::Accessor->new({first => 11, second => 12});
my $caf = Class::Accessor::Fast->new({first => 11, second => 12});
my $caff = Class::Accessor::Faster->new({first => 11, second => 12});

my %cmp_set = (
    'q2' => sub { $q2t->first(rand()) },
    'Class::Accessor' => sub { $ca->first(rand()) },
    'Class::Accessor::Fast' => sub { $caf->first(rand()) },
    'Class::Accessor::Faster' => sub { $caff->first(rand()) },
);

print "\nMutator benchmark:\n";
cmpthese(-1, \%cmp_set);

%cmp_set = (
    'q2' => sub { $q2t->first() },
    'Class::Accessor' => sub { $ca->first() },
    'Class::Accessor::Fast' => sub { $caf->first() },
    'Class::Accessor::Faster' => sub { $caff->first() },
);

print "\nAccessor benchmark:\n";
cmpthese(-1, \%cmp_set);


