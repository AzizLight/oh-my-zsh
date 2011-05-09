if [ -x `which brew` ]; then
    macvim_version=`brew list --versions macvim | sed 's/.* \([0-9\.\-]*\)$/\1/'`
    if [ -n "${macvim_version}" ]; then
        alias vim=`brew --prefix`/Cellar/macvim/${macvim_version}/MacVim.app/Contents/MacOS/Vim
    fi
fi

alias v="$VISUAL"

alias v.="v ."
alias vz="v $ZSH"
alias cv="c ~/.vim/"
alias vv="v ~/.{g,}vimrc"
alias -g vi="vim -"
