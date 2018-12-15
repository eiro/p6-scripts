
bag/mktemp () BAGFILE=$( mktemp ${1:-/tmp/bag-XXXXXXXXXX} )
bag/brag () ${(Q)${(z)BAGBRAG}} $BAGFILE
bag/fill-with () {
	(( $+BAGBRAG )) || local BAGBRAG
	(( $+BAGFILE )) || local BAGFILE
	bag/mktemp
	while {"$@" >> $BAGFILE} {:}
	bag/brag
}

fzf/mutt_aliases () {
	sed -rn 's/^alias +[^ ]+//p' ~/.muttrc |
		fzf --preview="cat $BAGFILE" --preview-window=down
}

bag/fzf/muttalias ()
	BAGBRAG="sed 's/^/$1: /'" bag/fill-with fzf/mutt_aliases
