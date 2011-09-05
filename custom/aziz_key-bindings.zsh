# swap ` and ~
# autoload -U swapkeys
# swapkeys \` \~

# Enable the C-x C-e shortcut to open the VISUAL editor
#  Doesn't work ...
# autoload edit-command-line
# zle -N edit-command-line
# bindkey '^x^e' edit-command-line

# I never use numbers in the terminal
# but I ofter use symbols
# Let's swap them
# TODO: put that in a function.
# swapkeys \! 1
# swapkeys \@ 2
# swapkeys \# 3
# swapkeys \$ 4
# swapkeys \% 5
# swapkeys \^ 6
# swapkeys \& 7
# swapkeys \* 8
# swapkeys \( 9
# swapkeys \) 0

# Fix the delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey    "^[-"            insert-last-word

# ...so that I can select the completions with the arrow
# keys after the first press of tab
zstyle ':completion:*:*:*:*:*' menu yes select