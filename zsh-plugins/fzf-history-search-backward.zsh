# when  history-incremental-search-backward is not enough
zle/fzf/history () BUFFER=$(
	fc -ln 0 |
	awk ' !length(f[$0]) { f[$0]=1 ; print} ' |
	fzf --tac --tiebreak=index
)
zle -N zle/fzf/history
bindkey '^r' zle/fzf/history
