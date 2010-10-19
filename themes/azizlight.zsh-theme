# display a different prompt char for git repos
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

# If the previous command failed, the prompt character will be red
local pchar="%(?,%{$fg[white]%}$(prompt_char)%{$reset_color%},%{$fg[red]%}$(prompt_char)%{$reset_color%})"

RPROMPT=''
PROMPT='%{$fg_bold[red]%}➜  %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
$pchar '
SUDO_PROMPT="$fg_bold[red]Sudo Password:$fg[default]"


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}»%{$reset_color%} %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}! %{$fg[red]%}%B✘%b%F{154}%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}? %{$fg[red]%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%F{154}"

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