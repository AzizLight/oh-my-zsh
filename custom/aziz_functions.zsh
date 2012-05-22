# apply changes made to the zsh config
az_echo_source ()
{
  echo "$fg[green]Sourced ~/.zshrc$fg[default]"
}

# pwd with style
p () {
  print -P "You are in: %F{white}%K{blue}$PWD%f%k\n"
}

# Copy the path to a file (including the filename)
pcf () {
  if [[ $OSTYPE[1,6] == 'darwin' ]]; then
    echo "$PWD/$1" |tr -d '\n'| pbcopy
  elif [[ $OSTYPE[1,6] == 'linux-' ]]; then
    echo "$PWD/$1" |tr -d '\n'| xclip -i
  fi
}

# show in which dir I am after a cd
c () {
  builtin cd "$@" &&
  p &&
  ls -AGF
}

# Make a new dir and move in it
mk () {
  command mkdir -p $* &&
  echo "\n\tFolders created: $fg[green]${*}$fg[default]\n"
}

# Make a new dir and move in it
mc () {
  command mkdir -p $1 &&
  echo "\n\tFolders created: $fg[green]${1}$fg[default]" &&
  builtin cd $1 &&
  echo "\nMoved to: $fg[white]$bg[blue]`pwd`$fg[default]$bg[default]\n"
}

# rm -rf with nice feedback
rf () {
  echo "\n\t$fg[red]Permanently removing ${*}...$fg[default]\n" &&
  command rm -rf $* &&
  echo "\n\t$fg[yellow]Items deleted: ${*}\n$fg[default]"
}

# Download a file in the current directory using curl
get () {
  curl -O $1 &&
  echo "\n$fg[green]Download Complete:$fg[default] ${1}\n"
}

# Download a file in the Downloads directory using curl
download () {
  builtin cd ~/_hazel &&
  get $1
  builtin cd $OLDPWD
}

# Switches two files contents
# taken from https://github.com/jqr/dotfiles/blob/master/bash_profile.d/switch.sh
switch() {
  mv $1 $1_orig &&
  mv $2 $1 &&
  mv $1_orig $2
}

# taken from https://github.com/jqr/dotfiles/blob/master/bash_profile.d/standard_improvements.sh
# TODO: Monotonous. add some colors!
# FIXME: this function makes it impossible to create more than one file at a time...
# touch() {
#   dir=`expr "$1" : '\(.*\/\)'`
#   if [ $dir ] 
#     then
#     mkdir -p $dir
#   fi
#   /usr/bin/touch $1
# }

# Fewer keystrokes to search man page of command
mg (){ man ${1} | egrep ${2} | more; }

# A function that allows you to perform a case-insensitive search in
# the current directory, and directories in the current directory (but no further),
# for files containing the first argument anywhere in their names.
quickfind () { find . -maxdepth 4 -iname "*$1*" }

# Create a zip archive
zz () {
  zip -r $1 $1
}

# Convert a markdown file in an HTML file
markdown () { 
  /Applications/TextMate.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html
}

# look up a word
dict () {
  curl -s dict://dict.org/d:$1 | perl -ne 's/\r//; last if /^\.$/; print if /^151/../^250/' | more
}
lsdict () {
  grep "$@" /usr/share/dict/words
}

# Create a backup of the file/folder passed as parameter and log the backup in the backup folder
bak () {
  date_time=`date +"%F_%H-%M-%S"`
  bak_dir=$HOME"/.my.backups/${1}.bak"
  dir=$bak_dir'/'${date_time}
  
  command mkdir -p $dir
  command cp -R $1 $dir
  
  # Log 1
  if [ ! -e $HOME"/.my.backups/backups.log" ]
  then
    touch $HOME"/.my.backups/backups.log" &&
    echo "Backups log\n(Arranged by backup date)\n" >> $HOME"/.my.backups/backups.log"
  fi
  echo "${date_time} :\t${dir}\t->\t`pwd`/${1}" >> $HOME"/.my.backups/backups.log"
  
  # Log 2
  if [ ! -e $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER" ]
  then
    touch $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER" &&
    echo "This file contains the path the original file/folder for each backup\n(Arranged by backup date)\n" >> $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER"
  fi
  echo "${date_time} :\t`pwd`/${1}" >> $bak_dir"/PATH_OF_ORIGINAL_FILE_OR_FOLDER"
  
  # Feedback
  echo "\n\t$fg[green]Backup Complete$fg[default]\n"
}

# Less radical alternative to the backup function above
# Taken from: http://github.com/rtomayko/dotfiles/blob/rtomayko/bin/orig
orig ()
{
    if [ $# = 0 ] ; then
        echo "usage: orig FILE ..."
        echo "copy FILE(s) to FILE.orig"
    else
        for f in "$@" ; do
            cp -p "$f" "$f.orig"
        done
    fi
}

# Yet another quick backup function
# Taken from bash-it: https://github.com/revans/bash-it/blob/master/plugins/base.plugin.bash
# 
# back up file with timestamp
# useful for administrators and configs
buf () {
  filename=$1
  filetime=$(date +%Y%m%d_%H%M%S)
  cp ${filename} ${filename}_${filetime}
}

# run a command quietly, suppressing any output whatsoever
# Taken from bash-it: https://github.com/revans/bash-it/blob/master/plugins/base.plugin.bash
quiet() {
  $* &> /dev/null &
}

# check if a domain name is registered
# Taken from here: http://jasonseifer.com/2010/05/05/osx-post-install-guide-4#dev
function isreg {
  whois $1 | grep -q 'No match' && echo "No" || echo "Yes"
}

# return the length of the string passed as argument
count () {
  echo ${#1}
}

# Display the Internal and External IPs
getip () {
  echo -n "Internal IP: "
  ifconfig en1 | awk '/inet /&&!/127.0.0.1/{sub(/^[^:]+:/,"",$2); print $2}'
  echo -n "External IP: "
  curl icanhazip.com
}

# List all available zsh colors
showcolors () {
  print -l ${(k)fg}
}

# List & display all 256 colors
showcolors256 () {
  for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

# search for various types or README file in dir and display them in $PAGER
# Taken from there:
# https://github.com/Valodim/oh-my-zsh/blob/2c65742d5f1b9679b0bd57863bad1690ecfef337/custom/misc.zsh
readme ()
{
    local files
    files=(./(#i)*(read*me|lue*m(in|)ut)*(ND))
    if (($#files))
    then $PAGER $files
    else
    print 'No README files.'
    fi
}

# Fortune Cookie
fortuneCookie() {
  # TODO: Check that the required commands are installed
  #
  # List of cow files available. The are 46 elements in the array.
  # The is probably a way to make this array dynamic,
  # but I don't have the patience or the time to find out how
  # Just in case, run `cowsay -l` and verify that you have all the cowfiles,
  #  else, replace the contents of the array with you cow files list.
  cowFiles=('beavis.zen' 'bong' 'bud-frogs' 'bunny' 'cheese' 'cower' 'daemon' 'default' 'dragon' 'dragon-and-cow' 'elephant' 'elephant-in-snake' 'eyes' 'flaming-sheep' 'ghostbusters' ''head-in'' 'hellokitty' 'kiss' 'kitty' 'koala' 'kosh' 'luke-koala' 'meow' 'milk' 'moofasa' 'moose' 'mutilated' 'ren' 'satanic' 'sheep' 'skeleton' 'small' 'sodomized' 'stegosaurus' 'stimpy' 'supermilker' 'surgery' 'telebears' 'three-eyes' 'turkey' 'turtle' 'tux' 'udder' 'vader' 'vader-koala' 'www');
  
  # Pick a random cow file
  cowFileIndex=$[ ( $RANDOM % 46 )  + 1 ]
  cowFile=${cowFiles[$cowFileIndex]}
  
  # Toilet filters
  toiletFilters=('--gay' '--metal')
  
  # Pick a random toilet filter
  toiletFilterIndex=$[ ( $RANDOM % 2 )  + 1 ]
  toiletFilter=${toiletFilters[$toiletFilterIndex]}
  
  fortune | cowsay -f $cowFile | toilet $toiletFilter -f term
}

# Usage: lspath [<var>]
# List path entries of PATH or environment variable <var>.
# Taken from http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc
lspath () { eval echo \$${1:-PATH} |tr : '\n'; }

# function that enables things like 'cd .../dir'
# ... gets replaced by ../.. automatically
# then every additional . gets replaced by /..
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# bc on the rocks
autoload -U zcalc

# mv on the rocks
# check the following page for more info
# http://xanana.ucsc.edu/~wgscott/xtal/wiki/index.php/Explanations_for_each_zsh_template_file#030_functions.distributed.zsh
autoload -U zmv

# Quickly switch between vim and mate
set_editor ()
{
  if [[ $1 == "mate" ]]; then
    local my_editor=$1
    echo "Editor set to $fg[magenta]mate$fg[default]"
  elif [[ $1 == "vim" ]]; then
    local my_editor=$1
    echo "Editor set to $fg[green]vim$fg[default]"
  else
    local my_editor="vim"
    echo "Editor set to $fg[green]vim$fg[default]"
  fi
  
  export EDITOR=$my_editor
  export FCEDIT=$my_editor
  export VISUAL=$my_editor
  export GIT_EDITOR=$my_editor
}
