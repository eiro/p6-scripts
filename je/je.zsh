# vim: noet ts=4

je_liste () {
	cut -f2 -d"	" "$@" |
		sort -u
}

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

je_sum () {
	local the=$(mktemp -d)
	mkfifo $the/report $the/tasks
	< $the/report cut -f2 > $the/tasks&
	sed '/^ *[^#]/!d' "$@"  |
		tee $the/report     |
		cut -f1             |
		date +%s -f-        |
		paste - $the/tasks  |
		awk -F'\t' -vOFS='\t' -vstop=stop -vOFMT='%.3g' -vts=1 -vtask=2 '
			start {
				did[cur] += $ts - start
				if ( $task ~ stop ) {
					start=cur="" ;
					next
				}
			}
			{ start=$ts ; cur=$task }
			END { for (d in did) print d,did[d]/3600 }
		'
	rm -rf $the
}
