# apply changes made to the zsh config
alias s="source /Users/aziz/.zshrc"

# rm, cp, mv, mkdir, etc <- regular stuff override
alias ls="CLICOLOR_FORCE=1 ls -FG"
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -vp"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias cal="cal -m"
alias df="df -h"
alias du="du -h -c | egrep 'total'"

# ls
alias l="ls -l"
alias la="ls -A"
alias ll="ls -Al"
alias lsh="ls -sh"
alias l.='ls -d .[^.]*'  # list hidden files only
# alias l.="ls -Ad .*" # alternative to the alias above
alias ll.='ll -d .[^.]*' # list hidden files only
alias "l*"="ls *"

# grep
alias -g "?"="| grep"
alias -g "e?"="| egrep"
alias -g "f?"="| fgrep"

# cd
alias .="p"
alias -- -="c -"

# which
alias wi="which"
alias wia="which -a"

# dir shortcuts
alias www="c ~/Sites"
alias cs="c ~/Sources"

# pwd
alias pc="builtin pwd|tr -d '\n'|pbcopy" # copy the path to the current folder to the clipboard

# make file(s) executable
alias x="chmod a+x"

# which
alias wh="builtin which"

# Find out if a mysql server is running and show info about it
alias find-mysql="netstat -ln | grep mysql"

# History
alias h="history"

# less
alias -g ":l"=" | less -R"

# most
alias -g ":m"="most"

# Copy ssh key to the clipboard
alias ss="cat ~/.ssh/id_rsa.pub|pbcopy"

# Ping
alias ping="ping -c 5"
alias google="ping www.google.com"

# make tree a little cooler looking.
alias tree="tree -CAFa -I 'rhel.*.*.package|.git' --dirsfirst"

# convert string to uppercase
alias -g ":upper"=" | tr \"[:lower:]\" \"[:upper:]\""
# convert string to lowercase
alias -g ":lower"=" | tr \"[:upper:]\" \"[:lower:]\""

# -------
# - PHP -
# -------

# This is kind of a hack to force MAMP's php to take precedence over OS X's and
# to force php cli to use the same php.ini config file as the active php
alias php="/Applications/MAMP/bin/php5.2/bin/php --php-ini /Library/Application\ Support/appsolute/MAMP\ PRO/conf/php.ini"

# Validate PHP from the Command Line
alias vp="php -v && php -d display_errors=on"

# ------------
# - CLI APPS -
# ------------

# autojump
alias js="jumpstat"

# irssii
alias i="irssi"

# TTYtter - Twitter CLI client
alias tt="ttytter"

# todo.txt cli
alias t="todo.sh"