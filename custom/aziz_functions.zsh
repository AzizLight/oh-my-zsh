p () {
  echo -n -e "You're in: $fg[blue]$bg[blue]"
  pwd
  echo -n -e "$fg[default]$bg[default]\n"
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
mkcd () {
  command mkdir -p $1 &&
  echo "\n\tFolders created: $fg[green]${1}$fg[default]" &&
  builtin cd $1 &&
  echo "\nMoved to: $fg[blue]$bg[blue]`pwd`$fg[default]$bg[default]\n"
}

# Download a file with curl
get () {
  builtin cd ~/Downloads &&
  curl -O $1 &&
  echo "\nDownload Complete : ${1}\n" &&
  builtin cd $OLDPWD
}

# Empty the Trash
empty () {
 command rm -rf ~/.Trash/* &&
 echo "\n\t$fg[yellow]Trash emptied successfully$fg[default]\n"
}

# Uninstall an application using AppZapper
zap () {
  open -a AppZapper /Applications/"${1}".app
}

# open a manpage in preview
pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}

# Create a zip archive
z () {
  zip -r $1 $1
}

# Convert a markdown file in an HTML file
markdown() { 
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
  date_time=`now`
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

# rm -rf with nice feedback
rf () {
  echo "\n\t$fg[red]Permanently removing ${*}...$fg[default]\n" &&
  command rm -rf $* &&
  echo "\n\t$fg[yellow]Items deleted: ${*}\n"
}

# cp -R with nice feedback
cr () {
  echo "\n\t$fg[yellow]Copying...\n" &&
  command cp -R $* &&
  echo "\n\t$fg[green]Items copied successfully!!$fg[default]\n"
}

# return the length of the string passed as argument
count () {
  echo ${#1}
}

function tm() {
  mate $1
  cd $1
}