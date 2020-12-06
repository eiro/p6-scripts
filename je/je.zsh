# vim: noet ts=4

je_liste () { cut -f2 -d"	" "$@" | sort -u ; }

je () {
	local it=$(
		case "$*" in
			('') je_liste ~/.je | fzy  ;;
			(*)  echo "$*"      | vipe ;;
		esac
	)
	test -n "$it" &&
		date +"%F %H:%M	$it" >> ~/.je
}

je/commence  () {
	echo "$*" |
	vipe      |
	read it
}

je () {
	local it
	if (( $+1 )) {
		je/commence "$*"
	} else {
		je/continue
	}
	test -n "$it" && date +"%F %H:%M	$it" >> ~/.je
}
