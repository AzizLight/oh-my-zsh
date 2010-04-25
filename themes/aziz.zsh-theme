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

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}→%{$reset_color%} git: %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""