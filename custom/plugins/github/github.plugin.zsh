# Inherit from the default github plugin
source $ZSH/plugins/github/github.plugin.zsh

# git + hub = github
# https://github.com/defunkt/hub
# BUG: If hub is not found, this bit of code produces some funky stuff...
function git()
{
	if [[ -x $(which hub) ]]; then
		hub "$@"
	else
		git "$@"
	fi
}

github-url () { git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'; }

# TODO: setup as a git alias in ~/.gitconfig
# taken from https://github.com/bkerley/zshkit/blob/master/06_git
github () { open $(github-url); }