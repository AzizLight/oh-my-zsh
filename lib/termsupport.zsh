case "$TERM" in
  xterm*|rxvt*)
    # Title bar contains either the pwd or the current job
    preexec () {
      print -Pn "\e]0;$1\a"  # xterm
    }
    precmd () {
      print -Pn "\e]0;%~\a"  # xterm
    }
    ;;
  screen*)
    preexec () {
      local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
      echo -ne "\ek$CMD\e\\"
      print -Pn "\e]0;%n@%m: $1\a"  # xterm
    }
    precmd () {
      echo -ne "\ekzsh\e\\"
      print -Pn "\e]0;%n@%m: %~\a"  # xterm
    }
    ;;
esac