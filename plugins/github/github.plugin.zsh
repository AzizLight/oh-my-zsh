# add github completion function to path
fpath=($ZSH/plugins/github $fpath)
autoload -U compinit
compinit -i

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