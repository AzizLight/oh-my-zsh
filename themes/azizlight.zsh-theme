# Most of the stuff in this theme is inspired/taken from other people's theme and/or from stuff I found by surfing the Web

# display a different prompt char for git repos
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

if [[ $az_prompt_type = 'simple' ]]
then
  # If the previous command failed, the prompt character will be red
  PROMPT='%{$fg_bold[red]%}➜  %{$reset_color%}'
  RPROMPT='%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}'
else
  # If the previous command failed, the prompt character will be red
  PROMPT='%{$fg_bold[red]%}➜  %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
%(?,%{$fg[white]%}$(prompt_char)%{$reset_color%},%{$fg[red]%}$(prompt_char)%{$reset_color%}) '

  # Taken-from-Sorin's-Theme------------------------------------------------------
  RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
  # ------------------------------------------------------------------------------
fi

PS2="%_ ❯ "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}»%{$reset_color%} %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
