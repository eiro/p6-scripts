directory-mru/hook/chpwd () { l $PWD >> ~/.was-pwd }

directory-mru/vaccum ()
	perl -lpi -0 -E '
		$_ =
		join "\n",
		reverse grep { !$seen{$_}++ && -e }
		reverse split /\n/
	' ~/.was-pwd

directory-mru/menu () {
	directory-mru/vaccum
	# fzf in history with most recent first in mind
	# (if you want to remove the 100 oldest: sed -i 1,100d ~/.was-pwd)
	local it
	fzf --tac --tiebreak=index < ~/.was-pwd | read it
	# cd if it was choosen (no cancel, no escape)
	(( $#it )) && cd $it
}
