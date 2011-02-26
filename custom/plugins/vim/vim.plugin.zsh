if [[ $OSTYPE[1,6] == 'darwin' ]]; then
  alias v="mvim"
elif [[ $OSTYPE[1,6] == 'linux-' ]]; then
  alias v="gvim"
fi

alias v.="v ."
alias vz="v $ZSH"
alias cv="c ~/.vim/"
alias vv="v ~/.{,g}vimrc.local"
alias vvv="v ~/.{,g}vimrc{,.local}"
alias vsnip="v ~/.vim/snippets/"
