# -----------
# - Aliases -
# -----------

# pbcopy and pbpaste
alias -g ":c"=" | pbcopy"
alias -g ":p"="pbpaste"

# Open Apps from the command line and open files using Apps from the command line (OS X only!)
alias o="open -a"
alias o.="o \"Path Finder\" ."
alias transmit='open -a Transmit'

# Lock screen
# Taken from here: http://github.com/rtomayko/dotfiles/blob/rtomayko/bin/lock-screen
alias lock="/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend"

# I disabled MAMP Pro's Dock icon using this method: http://blog-en.mamp.info/2010/02/how-to-hide-mamp-icon-from-your-dock.html
# Now MAMP Pro doesn't have a dock icon, a menu bar or the little 'x' button to close the main window
# so here is a little alias to quit MAMP Pro from the command line
alias mamp-quit="quit 'MAMP PRO'"

alias ql="qlmanage -p 2>/dev/null" # launch quicklook on a file

# refresh all GeekTool Geeklets
alias geek="osascript -e 'tell application \"geektool\" to refresh all'"

# Force Quit Firefox
alias killff="kill firefox-bin"

# Homebrew
alias -g b="brew"
alias bi="b install"
alias bs="b search"
alias "b?"="b info"

# Edit zsh config files with Textmate
alias mz='m $ZSH ~/.zshrc'
alias cz='c $ZSH'

# -------------
# - Functions -
# -------------

function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

# Quit an OS X application from the command line
quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}

# Relaunch an OS X application from the command line
relaunch () {
    for app in $*; do
        osascript -e 'quit app "'$app'"';
        sleep 2;
        open -a $app
    done
}

# Uninstall an application using AppZapper
zap () {
    open -a AppZapper /Applications/"${1}".app
}

# open a manpage in preview
# pman () {
#   man -t "${1}" | open -f -a /Applications/Preview.app
# }

# This is an alternate pman function that I prefer since
# Preview.app won't ask to save the file before it quits
# Required: ps2pdf (comes with ghostscript)
pman () {
    man -t $* | ps2pdf - - | open -g -f -a /Applications/Preview.app
}