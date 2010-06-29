# Scheduled sleep and wake (OS X only)
alias ss="sudo pmset schedule sleep"
alias sw="sudo pmset schedule wake"

alias s="source /Users/aziz/.oh-my-zsh/custom/aziz_aliases.zsh; source /Users/aziz/.oh-my-zsh/custom/aziz_functions.zsh;source /Users/aziz/.zshrc"

# Extract about anything
alias x="extract"

# df and du
alias df="df -h"
alias du="du -h -c | egrep 'total'"

# which
alias wi="which"
alias wia="which -a"

# top
alias tu='top -o cpu' # cpu
alias tv='top -o vsize' # memory

# find
alias f="find . -name"

# Find out if a mysql server is running and show info about it
alias find-mysql="netstat -ln | grep mysql"

# History
alias h="history"

# less
alias -g ":l"=" | less -R"

# Ping
alias ping="ping -c 5"
alias google="ping www.google.com"

# make tree a little cooler looking.
alias tree="tree -CAFa -I 'rhel.*.*.package|.git' --dirsfirst"

# ------------
# - CLI OS X -
# ------------

# Empty the trash
alias e="empty"

# Force Quit Firefox
alias killff="kill firefox-bin"

# pbcopy and pbpaste
alias -g ":c"=" | pbcopy"
alias -g ":p"="pbpaste"

# Open Apps from the command line and open files using Apps from the command line (OS X only!)
alias o="open -a"
alias o.="o \"Path Finder\" ."
alias transmit='open -a Transmit'

# Textmate
alias -g ":m"=" | mate"
alias m="mate"
alias m.="m ."
alias "m*"="m {*,.*}"
alias "m**"="m .*"
alias mp=":p :m"
alias mci="m /Users/aziz/Sites/ci/ci" # This is because I check CodeIgniter's source so often

# Edit zsh config files with Textmate
alias ea="m ~/.oh-my-zsh/custom"
alias eb="m ~/.oh-my-zsh ~/.zshrc"

# ------------

# ----------------------
# - File Manipulation  -
# -       and          -
# - Folder Navigation  -
# ----------------------

# ls
alias ls="CLICOLOR_FORCE=1 ls -FG"
alias l="ls -l"
alias la="ls -A"
alias ll="ls -Al"
alias lsh="ls -sh"
alias l.='ls -d .[^.]*'  # list hidden files only
alias ll.='ll -d .[^.]*' # list hidden files only
alias "l*"="ls *"
# alias dls="echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`"  # directory LS # TODO: Fix that alias
alias cl="clear; p; l"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias -g "?"="| grep"
alias -g "e?"="| egrep"
alias -g "f?"="| fgrep"

# rm, cp and mv
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

# cd
alias .="p"
alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."
alias .....="c ../../../.."
alias cdd="c -"
alias www="c ~/Sites"
alias cs="c ~/Sources"

# pwd
alias pc="builtin pwd|pbcopy"

# mkdir
alias mkdir="mkdir -vp"

# cal -m [month]
alias cal="cal -m"

# ----------------------

# ------------------
# - Ruby and Rails -
# ------------------

# open the Pickaxe in Preview.app
alias pickaxe="open /Users/aziz/Documents/eBooks/Ruby\ -\ Rails/Programming\ Ruby\ 1.9/Programming\ Ruby\ 1.9.pdf"

# Colored ri
alias ri="ri -f ansi -T"

# rvm: ruby 1.9.1
alias r91="rvm use 1.9.1"

# rvm: system -> ruby 1.8.7
alias r87="rvm use system"

# rvm: info
alias rinfo="rvm info"

# rvm: list
alias rls="rvm list"

# alias rails="rails -d mysql" # Automatically use mysql as the default database server
alias rss="ruby script/server"
alias rsg="ruby script/generate"
alias rsc="ruby script/console"

# gem
alias gemi="sudo gem install"
alias gemu="sudo gem update"
alias gems="gem search --remote"

# ------------------

# ---------
# - Other -
# ---------

# autojump
alias js="jumpstat"

# Force php cli to use the same php.ini config file as the active php
alias php="php --php-ini /Library/Application\ Support/appsolute/MAMP\ PRO/conf/php.ini"

# Validate PHP from the Command Line
alias vp="php -v && php -d display_errors=on"

# PHP Interactive Shell
alias phpshell="php /Users/aziz/Sites/pear/php-shell-cmd.php"

# Open a new Terminal.app window with a different color theme
alias basic="open /Users/aziz/bin/BasicTerminal.terminal"

# Symfony
alias symfony="php lib/vendor/symfony/data/bin/symfony"

# Git
alias clone="git clone"
alias gk="gitk --all &"
alias status="git status"
alias gls="git ls-files"
alias gb="git branch -a --color"

# hg
alias sglog="hg sglog"
alias hgc="hg commit"
alias hgp="hg push"
alias hgm="hg merge"

# irssi
alias i="irssi"

## awesome useless commands
# watch star wars episode IV in ASCII art
alias starwars='telnet towel.blinkenlights.nl'

# ---------

# ================== #
# = Suffix Aliases = #
# ================== #

alias -s pdf="o preview"
alias -s chm="o iChm"
alias -s txt="mate"
alias -s php="mate"

# =======================
# = Ignored Completions =
# =======================

alias cake="nocorrect cake"
alias irssi="nocorrect irssi"
alias pear="nocorrect pear"
alias aria="nocorrect aria2c -d /Users/aziz/Downloads/_hazelbox"