# add rvm completion function to path
fpath=($ZSH/plugins/rvm $fpath)
autoload -U compinit
compinit -i

alias r192="rvm use 1.9.2"
alias r191="rvm use 1.9.1"
alias r186="rvm use 1.8.6"
alias r187="rvm use 1.8.7"
alias rd="rvm use default"
alias rg="rvm gemset"
alias rgl="rvm gemset list"