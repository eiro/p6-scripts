use Sympatic;
use Test::More;

my %regex_by =
( afranke => qr/
    ^
    [[\p{White_Space}]*  # de 0 a N espace ou char "["
    X            # un emoji
    [\p{White_Space}]*]+ # de 1 a n (0 a n espaces )
    $
    /x
, eiro    => qr/
    ^[X\p{White_Space}]* # de 0 a n espaces ou emojis
    X                    # un emoji
    [X\p{White_Space}]*  # de 0 a n espaces ou emojis
    $
    /x
);


for my $emostring (
    "X",
    "X X",
    " X",
    "XX"
) {
    for my $player (qw( afranke eiro )) {
        ok +( $emostring =~ $regex_by{$player} ) =>
            "$player found $emostring"
    }
}
done_testing;

# for my $emostring (
#     "👍",
#     "💪 💪",
#     " 😜",
#     "😙🤗"
# ) {
#     for my $player (qw( afranke eiro )) {
#         ok +( $emostring =~ $regex_by{$player} ) =>
#             "$player found $emostring"
#     }
# }




