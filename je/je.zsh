# vim: noet ts=4

je/liste () {
	awk -F"\t" -vdesc=2 '{print $desc}' "$@"|sort -u
}

je/continue  () {
	je/liste ~/.je     |
	fzf                |
	read it
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
