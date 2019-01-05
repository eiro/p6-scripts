mail/box () {
	setopt localoptions no{notify,monitor}
	local as
	l "ctrl-o to select, <return> to check"
	while {true} {
		set -- ~/local/mail/*/new/*(N:h:h:t) renater phear unistra laposte sync bgsync
		set -- "${(u)@}"
		local ctrl=
		l "$@" |
			fzf --preview='mail/check/preview' --preview-window=down --expect=ctrl-o |
			{ read ctrl; read as }
		case $as {
			('') return ;;
			(bgsync) mail/check & ;;
			(sync)   mail/check   ;;
			(*) mail/as $as
				case $ctrl { (ctrl-o) return ;; }
				mutt
			;;
		}
	}
}

