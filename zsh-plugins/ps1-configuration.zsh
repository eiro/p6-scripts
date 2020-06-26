# vim: noet
# PS1_GITSTATUS=
# PS1_GITSTATUS_UPDATE=false

ps1-updatable\? () true

ps1-quiet () {
	ps1-updatable\? () false
	export PS1='%F{red} ▶ %f'
}

ps1-into-git-repo\? ()
    shush git rev-parse --show-toplevel

ps1-update () {
	local it
	ps1-updatable\? || return
	GOTMAIL="$(
		set -- ~/local/mail/^Trash/new/*(N:h:h:t)
		test -n "$*" && echo $( l $@ | uniq -c ))"
	local it= branch=
	local doing_this="$( tac ~/.je | sed  's/.\{17\}//;q' )"
	if [[ stop = $doing_this ]] {
		doing_this="%B%K{red}%F{white}▒ NO ACTIVE TASK ▒%f%k%b"
	} else {
		# TODO: make it a library
		local graph_range=.▁▂▃▄▅▆▇█
		# digraphs lb et RB
		# this is a fake remaining bar just to let you remember
		# how awesome it could be to have one!
		doing_this="▐%F{green}▒▒▒▒%F{gray}▒▒▌%f $doing_this"
	}
	PS2="▒░ ▷ "
    # it+=" 📝 (+$( sed '/^$/q' ~p/start |wc -l)) $doing_this "
	# it+=$'\n'
    # argv=( yellow/black "▒░ %~" )
	local date
	# print -Pv date '(?.%F{green}$icons[OK_ICON].%F{red}$icons[FAIL_ICON]) %D %T '
	argv+=(
		white/black
		"░ ${TMUX_PANE:+ 📺${TMUX_PANE#%} }${GOTMAIL:+ 📨 }"'%(?.%F{green}$icons[OK_ICON].%F{red}$icons[FAIL_ICON])%f %2~'
	)
    { shush2 git rev-parse --abbrev-ref HEAD | read branch } &&
        argv+=( black/white "  $branch ± $( g s | wc -l ) files" )
    breadcrumb/colored $@
	# test -s ~/.notif && it+=$'\n'"▒░ 📝%F{red}$(< ~/.notif ) %f"
	it+=$'\n'$PS2
    PS1="▒$it"
    # use the whole line ?
	# # PS1="%K{blue}%F{white}$infos${(l:$[COLUMNS-$#infos - 2]:: :):-}
}

gotmail/update () {
	local __name__=${1:-GOTMAIL}
	set -- ~/local/mail/^Trash/new/*(N:h:h:t)
	set -- ${(u)@}
	print -v $__name__ "${*:+#[bg=black] 📨 }"
}

# (( $+TMUX_PANE )) && ps1-update () {
# 	local GOTMAIL
# 	gotmail/update
# 	local gitshow=
# 	# TODO: use git/dir-show()
# 	{ 2>/dev/null git rev-parse --abbrev-ref HEAD | read gitshow } &&
# 		gitshow="#[bg=white]#[fg=blue] $gitshow ± $( g s | wc -l ) files"
# 	tmux set status-right " $GOTMAIL $gitshow"
# }
