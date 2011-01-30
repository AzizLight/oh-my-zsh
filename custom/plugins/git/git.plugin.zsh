# Inherit from the default git plugin
source $ZSH/plugins/git/git.plugin.zsh

# Aliases
alias gcm='git commit -m'
alias ga='git add .'
alias gs='git status'
alias gcb="git checkout -b"
alias gba='git branch -a --color'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias ggl="git log --max-count=20 --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# clone what's in the clipboard
# Works only on OS X
# TODO: the alias sucks ass, rename it to something better!
alias gclp="git clone $(pbpaste)"

# taken from https://github.com/bkerley/zshkit/blob/master/06_git
git-scoreboard () { git log | grep '^Author' | sort | uniq -ci | sort -r; }
