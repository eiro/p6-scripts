# vim: noet sts=4

mail/box () {
	setopt localoptions no{notify,monitor}
	local as
	l "ctrl-o to select, <return> to check"
	while {true} {
		# boxes order is important as fzf gives more chances to first
		argv=(
			# first : boxes with incoming mails
			~/local/mail/^Trash/new/*(N:h:h:t)
			# second: all the mutt accounts (including those with no sync)
			~/.mutt/account/*(:t)
			# the actions sync (should be automated too ?)
			# l ${${(k)functions[(I)mail/box/actions/*]}:t}
			sync bgsync
		)
		# when repeating, only the first one is kept
		argv=( ${(u)argv} )
		local ctrl=
		l "$@" |
			fzf --preview='mail/check/preview' --preview-window=left:99% --expect=ctrl-o |
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

