# vim: noet ts=4

je_rapporte () date +"%F %H:%M	$*"

# examples :
# <<. je_dis
# -1day 1854;stop
# today 1000;rh,medical
# .
je_dis () {
	sed '
		s/^/-d/
		s/;/\n+%F %H:%M	/g
	'|xargs -rd'\n' -n2 date
}

je () {
	< ~/.je cut -f2 -d"	" |
		sort -u | fzy   |
		sed 's/^/now;/' |
		je_dis >>~/.je
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
