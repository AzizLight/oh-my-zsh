# Most of the stuff in this theme is inspired/taken from other people's theme and/or from stuff I found by surfing the Web

# display a different prompt char for git repos
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

# -Time-since-last-git-commit---------------------------------------------------
# Taken from https://github.com/garybernhardt/dotfiles
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

function az_git_prompt_info {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  local NORMAL="$fg[default]"
  local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
  if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
      local COLOR="$fg[red]"
  elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      local COLOR="$fg[yellow]"
  else
      local COLOR="$fg[green]"
  fi

  if [ "$MINUTES_SINCE_LAST_COMMIT" -lt 180 ]; then
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m:${NORMAL}"
  fi
  # The __git_ps1 function inserts the current git branch where %s is
  local GIT_PROMPT="${SINCE_LAST_COMMIT}%{$fg[magenta]%}"
  
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${GIT_PROMPT}${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
# ------------------------------------------------------------------------------


if [[ $(hostname) == "naboo" ]]; then
  local az_prompt_char="%{$fg_bold[blue]%}➜"
elif [[ $(hostname) == "tatooine" ]]; then
  local az_prompt_char="%{$fg_bold[red]%}➜"
fi

if [[ $az_prompt_type = 'simple' ]]
then
  # If the previous command failed, the prompt character will be red
  PROMPT='$az_prompt_char %{$reset_color%}'
  RPROMPT='%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} '
else
  # If the previous command failed, the prompt character will be red
  PROMPT='$az_prompt_char %{$fg_bold[green]%}%c%{$reset_color%} $(az_git_prompt_info)
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

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}»%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
