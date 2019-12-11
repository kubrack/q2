# SYNOPSIS
```
  package q2t;
  use base qw(q2);

  # first of all
  q2t->mk_accessors(qw(first second third));

  # new() included
  my $obj1 = q2t->new({first => 11, second => 12});

  print $obj1->first(); # 11
  print $obj1->third(33); # 33, mutator returns the new value
  print $obj1->first(111); # 111
```

# DESCRIPTION

Simple base class for generation fast accessors.

# BENCHMARK
```
$ perl q2b.pl

Mutator benchmark:
                             Rate Class::Accessor Class::Accessor::Fast Class::Accessor::Faster   q2
Class::Accessor         1442616/s              --                  -47%                    -53% -58%
Class::Accessor::Fast   2706501/s             88%                    --                    -11% -21%
Class::Accessor::Faster 3054952/s            112%                   13%                      -- -11%
q2                      3440640/s            139%                   27%                     13%   --

Accessor benchmark:
                             Rate Class::Accessor Class::Accessor::Fast Class::Accessor::Faster   q2
Class::Accessor         1571965/s              --                  -55%                    -64% -65%
Class::Accessor::Fast   3524477/s            124%                    --                    -19% -21%
Class::Accessor::Faster 4324584/s            175%                   23%                      --  -3%
q2                      4453902/s            183%                   26%                      3%   --
```
