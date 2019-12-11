package q2;

use strict;
use warnings;

use Carp qw(confess);

our $last_free_property_slot = 0;

sub new {
    my $self =  bless [], ref $_[0] || $_[0];
    if (ref $_[1]) {
        # accessors should be built at this point
        while (my ($k, $v) = each %{$_[1]}) {
            $self->$k($v);
        }
    }
    return $self;
}

sub mk_accessors {
    my $self = shift;
    my $class = ref $self || $self;
    while (my $name = pop @_) {
        $class->_mk_accessor($name);
    }
}

sub _mk_accessor {
    no strict 'refs';
    my $self = shift;
    my $name = shift;
    my $class = ref $self || $self;
    confess "Sub named $name already exists" if $class->can($name);

    my $index = $last_free_property_slot;
    my $accessor = sub {
        return $_[0]->[$index] if 1 == scalar @_;
        $_[0]->[$index] = $_[1];
    };
    *{"${class}::$name"} = $accessor;
    $last_free_property_slot++;
}

1;

__END__
=head1 SYNOPSIS

  package q2t;
  use base qw(q2);

  # first of all
  q2t->mk_accessors(qw(first second third));

  # new() included
  my $obj1 = q2t->new({first => 11, second => 12});

  print $obj1->first(); # 11
  print $obj1->third(33); # 33, mutator returns the new value
  print $obj1->first(111); # 111


=head1 DESCRIPTION

Minimal base class for generation fast accessors.

=cut
