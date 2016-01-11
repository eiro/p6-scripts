use Test::More;

BEGIN { do "bin/ht.." }

is_deeply [name]
,[qw( name booh )]
, $_ for 'booh';

is_deeply [repeat,name,id]
, [qw( repeat 4 name booh )]
, $_ for '4*booh';

is_deeply [tag]
, [qw( repeat 4 name booh  )]
, $_ for '4*booh';


is_deeply +{tag}
, +{ qw( name div id foo )
    , class => [qw( this is )] }
, $_ for 'div#foo.this.is';

done_testing; 


