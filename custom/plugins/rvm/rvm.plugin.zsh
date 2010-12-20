# add rvm completion function to path
fpath=($ZSH/plugins/rvm $fpath)
autoload -U compinit
compinit -i

alias rvmi="rvm info"
alias rl="rvm list"
alias r192="rvm use 1.9.2"
alias r191="rvm use 1.9.1"
alias r186="rvm use 1.8.6"
alias r187="rvm use 1.8.7"
alias rd="rvm use default"
alias rg="rvm gemset"
alias rgl="rvm gemset list"

# get the ruby name and version as well as the gemset
# from https://github.com/jtzemp/oh-my-zsh/blob/deb452e823876e26bc91947fdd55f75873b02c1d/lib/rvm.zsh#L9
rvg() {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="$fg[blue]@$fg[green]$gemset$fg[default]" # <- The @ sign is here
  
  # local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local version=$(~/.rvm/bin/rvm-prompt s i v)
  [ "$version" != "" ] && version="$fg[red]$version$fg[default]"
  
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}
