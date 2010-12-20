# Inherit from the default textmate plugin
source $ZSH/plugins/textmate/textmate.plugin.zsh

# add the textmate plugin specific bin dir
path=($ZSH/custom/plugins/textmate/bin $path)

# Aliases
alias m.="mate .*"
alias mp="pbpaste | mate"

# Open a directory in Textmate and move into that directory in the terminal
mc () {
	echo "Opening $fg[cyan]${1}$fg[default] in $fg[blue]Textmate$fg[default]..." &&
	mate $1
	if [[ -d $1 ]]; then
		builtin cd $1
		echo "\nMoved to: $fg[cyan]$bg[blue]`pwd`$fg[default]$bg[default]"
	fi
}

# Create the directory (structure), move to the (deepest) created dir,
# and open it in Textmate
mktm () {
	command mkdir -p $1 &&
	echo "\n\tFolders created: $fg[green]${1}$fg[default]" &&
	builtin cd $1 &&
	echo "\nMoved to: $fg[cyan]$bg[blue]`pwd`$fg[default]$bg[default]" &&
	echo "Opening directory in $fg[blue]Textmate$fg[default]..." &&
	mate .
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