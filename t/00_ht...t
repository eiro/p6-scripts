use Test::More;

BEGIN { do "bin/ht.." }

is_deeply {name}
,{qw( name booh )}
, $_ for 'booh';

is_deeply {repeat,name,id}
, {qw( repeat 4 name booh )}
, $_ for '4*booh';

is_deeply {tag}
, {qw( repeat 4 name booh  )}
, $_ for '    4*booh';

is_deeply +{tag}
, +{ qw( name div id foo )
    , class => [qw( this is )] }
, $_ for 'div#foo.this.is';

is_deeply +{tag}
, +{qw( id foo ) , children => +{qw( name p id bar ) } }
, $_ for '      #foo/p#bar';

done_testing; 


