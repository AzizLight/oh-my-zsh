# Inherit from the default osx plugin
source $ZSH/plugins/osx/osx.plugin.zsh

# add the osx plugin specific bin dir
path=($ZSH/custom/plugins/osx/bin $path)

# ------------------------------------------------------------------------------
# - Aliases -
# ------------------------------------------------------------------------------

# pbcopy and pbpaste
alias -g ":c"=" | pbcopy"
alias -g ":p"="pbpaste"

# Open Apps from the command line and open files using Apps from the command line (OS X only!)
alias o="open -a"
alias o.="o \"Path Finder\" ."

# Lock screen
# Taken from here: http://github.com/rtomayko/dotfiles/blob/rtomayko/bin/lock-screen
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Show/Hide Desktop icons.
# TODO: create a toggle alias/function
alias hide-desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show-desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Force Quit Firefox
alias killff="kill firefox-bin"

# Growl - Start and Stop
# TODO: Create a "toggle-growl" function
alias start-growl="osascript -e 'tell application \"GrowlHelperApp\" to activate'"
alias stop-growl="osascript -e 'tell application \"GrowlHelperApp\" to quit'"
alias check-growl="osascript -e 'tell application \"System Events\"
  set isRunning to ¬
    count of (every process whose name is \"GrowlHelperApp\") > 0
end tell'"

# taken from https://github.com/bkerley/zshkit/blob/master/05_editor
# Abuse the "open" command on OS X
if [[ $OSTYPE[1,6] == "darwin" ]]; then
  for s in mp3 wav aac \
    avi mp4 m4v mov qt mpg mpeg \
    jpg png psd bmp gif tif tiff \
    ps pdf html dmg; do
    alias -s $s=open
  done
fi

# ------------------------------------------------------------------------------
# - Functions -
# ------------------------------------------------------------------------------

# cd to the directory in the frontmost TextMate window
# optionally, open the directory in FInder/Path Finder
# taken from the zsh-templates-osx project:
# http://code.google.com/p/zsh-templates-osx/
autoload -U cdt

# TODO: Create a function to open applications more easily.
#   Basically extend the open command.

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
  cd "$(fp)"
}
# ------------------------------------------------------------------------------

# taken from https://github.com/jqr/dotfiles/blob/master/bash_profile.d/notification.sh
notify() {
  growlnotify -m $2 $1 2> /dev/null
  echo "**********************************************************************"
  echo "**"
  echo "** $2: $1"
  echo "**"
  echo "**********************************************************************"
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

# ------------------------------------------------------------------------------
# These functions were taken from:
# https://github.com/SpookyET/oh-my-zsh/blob/master/plugins/osx/osx.plugin.zsh

# launch quicklook on a file
function ql() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null
}

# Open a new tab in the current terminal
# Works with Terminal.app and iTerm
function tab() {
  local command="cd \\\"$PWD\\\""
  (( $# > 0 )) && command="${command}; $*"

  the_app=$(
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell
EOF
  )

  [[ "$the_app" == 'Terminal' ]] && {
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
        tell application "Terminal" to do script "${command}" in front window
      end tell
EOF
  }

  [[ "$the_app" == 'iTerm' ]] && {
    osascript 2>/dev/null <<EOF
      tell application "iTerm"
        set current_terminal to current terminal
        tell current_terminal
          launch session "Default Session"
          set current_session to current session
          tell current_session
            write text "${command}"
          end tell
        end tell
      end tell
EOF
  }
}
# ------------------------------------------------------------------------------

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

# Open man pages in Google Chrome.
# This functions requires bcat (`gem install bcat`)
# and Google Chrome.
# The output also looks like shit, so just use pman instead.
#
# Taken from: http://apple.stackexchange.com/questions/5435/terminal-tips-and-tricks-for-mac-os-x?page=2&tab=votes#answer-5469
bman () {
    gunzip < ~man -w $@~ | groff -Thtml -man | bcat -b "Google Chrome"
}
