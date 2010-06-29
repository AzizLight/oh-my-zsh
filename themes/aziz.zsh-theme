function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function az_hg_prompt() {
	ref=$(hg branch 2> /dev/null) || return
	tags=$(hg id --tags 2> /dev/null)
	dirty=$(hg status --no-color 2> /dev/null | awk '$1 == "?" { print "?" } $1 != "?" { print "!" }' | sort | uniq | head -c1)
	echo "%{$fg[blue]%}→%{$reset_color%} hg: %{$fg[magenta]%}${ref}%{$fg[green]%}${dirty} %{$fg_bold[black]%}%{$bg[yellow]%}${tags}%{$bg[default]%}%{$reset_color%}"
}

PROMPT='%{$fg_bold[red]%}➜  %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(az_hg_prompt)$(git_prompt_info)
$(prompt_char) '

# Add the ruby version used to the prompt
# PROMPT="\$(~/.rvm/bin/rvm-prompt i v) $PROMPT"

# Fix the delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}→%{$reset_color%} git: %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Colorful man pages!!
if [[ -x ` which less` ]]
export LESSCHARSET="utf-8"
then
    export PAGER="less"
    if [ $terminfo[colors] -ge 8 ]
    then
        export LESS_TERMCAP_mb=$'\E[01;31m'
        export LESS_TERMCAP_md=$'\E[01;31m'
        export LESS_TERMCAP_me=$'\E[0m'
        export LESS_TERMCAP_se=$'\E[0m'
        export LESS_TERMCAP_so=$'\E[01;44;33m'
        export LESS_TERMCAP_ue=$'\E[0m'
        export LESS_TERMCAP_us=$'\E[01;32m'
    fi
else
    export PAGER="more"
fi