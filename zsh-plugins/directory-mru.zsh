directory-mru/hook/chpwd () { l $PWD >> ~/.was-pwd }

directory-mru/menu () {
	mru-vaccum ~/.was-pwd | sponge ~/.was-pwd
	# sk in history with most recent first in mind
	# (if you want to remove the 100 oldest: sed -i 1,100d ~/.was-pwd)
	local it
	sk --tac --tiebreak=index < ~/.was-pwd | read it
	# cd if it was choosen (no cancel, no escape)
	(( $#it )) && cd $it
}
