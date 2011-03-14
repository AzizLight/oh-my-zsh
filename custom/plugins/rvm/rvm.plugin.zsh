# add rvm completion function to path
fpath=($ZSH/plugins/rvm $fpath)
autoload -U compinit
compinit -i

alias rv="rvm"
alias rvg="rvm gemset"
alias rvgl="rvm gemset list"
alias rvrc="rvm --rvmrc --create"
alias rvd="rvm use default"

# get the ruby name and version as well as the gemset
# from https://github.com/jtzemp/oh-my-zsh/blob/deb452e823876e26bc91947fdd55f75873b02c1d/lib/rvm.zsh#L9
rvv() {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="$fg[blue]@$fg[green]$gemset$fg[default]" # <- The @ sign is here
  
  # local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local version=$(~/.rvm/bin/rvm-prompt s i v)
  [ "$version" != "" ] && version="$fg[red]$version$fg[default]"
  
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}
