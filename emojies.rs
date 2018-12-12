extern crate regex;

fn main() {
    let messages = vec![
        "xx",
        "xx  ",
        "xxx  ",
        "👍",
        "💪️ 💪",
        " 😜️",
        "😜️ ",
        " 😜️ ",
        " 😜️ 😜️ 😜️ ",
        " 😜️😜️ 😜️ ",
        " 😜️A😜️A😜️ ",
        " 😜️😜️ ",
        "😙️🤗️",
    ];
    let emoji_regex: regex::Regex = regex::Regex::new(
        r"\p{Emoji}(?P<weird>.*)$",
        // r"^💪️ 💪$",
        //r"xx\s*$" // (\p{Emoji}|\s)*"
        // r"\s*\p{Emoji}$" // (\p{Emoji}|\s)*"
        // r"\p{Emoji}                       # an emoji
        // # (?x) ^ \s .*
        // # [\p{Emoji}\p{White_Space}]*     # 0 or more spaces or emoji
        // # \p{Emoji}                       # an emoji
        // # [\p{Emoji}\p{White_Space}]*     # 0 or more spaces or emoji
        // $
        // "
        ).unwrap();

    for m in &messages {
        if emoji_regex.is_match(m) {
            println!("ok for {}", m )
        }
    }
}
