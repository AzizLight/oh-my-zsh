# add gem completion function to path
fpath=($ZSH/plugins/gem $fpath)
autoload -U compinit
compinit -i

alias gei="gem install"
alias gel="gem list"
alias ges="gem search --remote"