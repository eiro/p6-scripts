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
	{ sed '/^ *[^#]/!d' "$@"
		je_rapporte stop
	} | tee $the/report    |
		cut -f1            |
		date +%s -f-       |
		paste - $the/tasks |
		awk -F'\t' -vOFS='\t' -vstop=stop -vOFMT='%.3g' -vts=1 -vtask=2 '
			start {
				did[cur] += $ts - start
				if ( $task ~ stop ) {
					start=cur="" ;
					next
				}
			}
			{ start=$ts ; cur=$task }
			END { for (d in did) print did[d]/3600,d }
		'
	rm -rf $the
}

je_me_barre () {
	je_sum < ~/.je|sort -rn| awk -F'\t' '
		{ bar=""; s=0
			while (s++ < $1) bar=bar"▄"
			while (s++ < 10) bar=" "bar
			print "[37m"bar"│[39m "$2" ("$1")"
		}
	'
}
