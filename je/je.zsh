je/travaille () {awk -F"\t" -vdesc=2 '{print $desc}' "$@"|sort -u}
je/continue  () { je/travaille ~/.je | fzf | read it }
je/commence () {
	# well ... pretty sure i can uze a zsh widget there
	local tmp=
	mktemp | read tmp
	echo "$*" > $tmp
	${EDITOR:-vim} $tmp
	read it < $tmp
	rm -rf $tmp
}
je () {
	local it
	if (( $+1 )) { je/commence "$*" } else { je/continue }
	test -n "$it" && date +"%F %H:%M	$it" >> ~/.je
}
