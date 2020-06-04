FIXLINES(1) - General Commands Manual

# NAME

**fixlines** - a simple multiple files patch system

# SYNOPSIS

**fixlines**
*files&nbsp;...*

# DESCRIPTION

fixlines is a filter that behave as a reverse
of "grep -Hn" filter so

    &lt;&lt;. fixlines
    data/A:3:hello
    data/A:5:world
    data/A:3:hello
    data/A:5:world
    .

is equivalent to

    sed -i 3ihello data/A
    sed -i 5iworld data/A
    sed -i 3ihello data/B
    sed -i 5iworld data/B

it was originaly writen as a vi companion

    :r!grep -N foo \*
    \[edit, edit, edit ...]
    :%!fixlines

 \- June 5, 2020
