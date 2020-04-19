# when history-incremental-search-backward is not enough

history-incremental-search-backward-fuzzy () BUFFER=$(
    fc -ln 0 |
        awk '!f[$0]++' |
        sk --tac --tiebreak=index
)

zle -N history-incremental-search-backward-fuzzy
bindkey '^r' history-incremental-search-backward-fuzzy
