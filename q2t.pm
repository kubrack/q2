package q2t;
use strict;
use warnings;
use base qw(q2);

q2t->mk_accessors(qw(first second third));

sub fourth {
    print "fourth\n";
}

1;
