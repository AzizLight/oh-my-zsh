# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/functions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load all of your custom configurations from custom/
for config_file ($ZSH/custom/*.zsh) source $config_file

# Load all of the plugins that were defined in ~/.zshrc
plugin=${plugin:=()}
for plugin ($plugins) 
  # First check in the custom/ directory.
  if [ -d $ZSH/custom/plugins/$plugin ]; then
    source $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh;
  else
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh;
  fi

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Load the theme
source "$ZSH/themes/$ZSH_THEME.zsh-theme"

# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" = "true" ]
then
  return
else
  /usr/bin/env zsh $ZSH/tools/check_for_upgrade.sh
fi

unset config_file
