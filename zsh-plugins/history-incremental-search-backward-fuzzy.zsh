# when history-incremental-search-backward is not enough

# fzy replaces sk --tac --tiebreak=index
history-incremental-search-backward-fuzzy () BUFFER=$(
    fc -ln 0 | awk '!f[$0]++' |tac|fzy
)

zle -N history-incremental-search-backward-fuzzy
bindkey '^r' history-incremental-search-backward-fuzzy
