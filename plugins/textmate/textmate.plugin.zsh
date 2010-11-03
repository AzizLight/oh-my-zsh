path=($ZSH/plugins/textmate/bin $path)

# Textmate
# alias m="mate"
alias m.="mate ."
alias mp="pbpaste | mate"

# Open a directory in Textmate and move into that directory in the terminal
tm () {
	mate $1
	if [[ -d $1 ]]; then
		cd $1
	fi
}

# Used for creating scripts.
# This little function creates the script files and
# makes them executable before opening them with TextMate
mx () {
	touch $*
	x $*
	m $*
}

# open manpage in Textmate
tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}