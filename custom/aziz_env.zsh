# ~/bin
path=( /Users/aziz/bin $path )
path=( /Users/aziz/Dropbox/bin $path ) # The new bin dir is synched with dropbox.

# .oh-my-zsh/bin
path=( $ZSH/bin $path )

# MAMP Pro
path=( /Applications/MAMP/bin/php5.2/bin $path )
path=( /Applications/MAMP/Library/bin $path )
path=( /Applications/MAMP/bin/php5/bin $path )

# Homebrew
path=( /Users/aziz/.homebrew/bin $path )

# yiiframework
path=( $path /Users/aziz/Sites/yii/framework )

export EDITOR='mate'
export FCEDIT='mate -w'
export VISUAL='mate -w'
export PAGER='most'
export GIT_EDITOR="mate -wl1"

# Note: if `export CDPATH=.:~` is used instead
# autocompletion will not work for dirs that
# are not in the current dir.
cdpath=( $cdpath ~ )