# -----------
# - Aliases -
# -----------

# pbcopy and pbpaste
alias -g ":c"=" | pbcopy"
alias -g ":p"="pbpaste"

# Open Apps from the command line and open files using Apps from the command line (OS X only!)
alias o="open -a"
alias o.="o \"Finder\" ."
alias transmit='open -a Transmit'

# Lock screen
# Taken from here: http://github.com/rtomayko/dotfiles/blob/rtomayko/bin/lock-screen
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

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

# Growl - Start and Stop
# TODO: Create a "toggle-growl" function
alias start-growl="osascript -e 'tell application \"GrowlHelperApp\" to activate'"
alias stop-growl="osascript -e 'tell application \"GrowlHelperApp\" to quit'"
alias check-growl="osascript -e 'tell application \"System Events\"
  set isRunning to ¬
    count of (every process whose name is \"GrowlHelperApp\") > 0
end tell'"

# -------------
# - Functions -
# -------------

# cd to the directory in the frontmost TextMate window
# optionally, open the directory in FInder/Path Finder
# taken from the zsh-templates-osx project:
# http://code.google.com/p/zsh-templates-osx/
autoload -U cdt

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

# ------------------------------------------------------------------------------
# The three functions below were taken from this gist:
# https://gist.github.com/710805

# Print Finder Directory
function fp() {
  osascript 2>/dev/null <<EOF 
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Print Finder Selection
function fs() {
  osascript 2>/dev/null <<EOF 
    set output to ""
    tell application "Finder" to set the_selection to selection
      set item_count to count the_selection
      repeat with item_index from 1 to count the_selection
        if item_index is less than item_count then set the_delimiter to "\n"
        if item_index is item_count then set the_delimiter to ""
        set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter 
      end repeat
EOF
}

# Change to the current finder directory
function cf() {
  cd "$(pfd)"
}
# ------------------------------------------------------------------------------

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