# add gem completion function to path
fpath=($ZSH/plugins/gem $fpath)
autoload -U compinit
compinit -i

alias gemi="gem install"
alias geml="gem list"
alias gems="gem search --remote"