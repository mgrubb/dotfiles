#!/bin/ksh

case $- in
	*i*) ;;
	*) return 0;;
esac

set -o vi
set -o viraw

case $TERM in
	screen) export TERM=dtterm ;;
esac

# Launch apps
alias sg='launch /Developer/Applications/SmartGit.app'

# Screen stuff
alias sd='screen -d'
alias sr='screen -r -A -O'
alias sl='screen -list'

# Vi stuff
GVIM='/usr/bin/gvim'
#alias vi="$GVIM --remote-silent"
#alias vk="$GVIM --remote-wait-silent $HOME/.kshrc && . $HOME/.kshrc"
#alias vp="$GVIM --remote-wait-silent $HOME/.profile && . $HOME/.profile"
alias vi="$GVIM"
alias vi!='/usr/bin/vi'
alias vim='/usr/bin/vim'
alias vk="$GVIM -f $HOME/.kshrc && . $HOME/.kshrc"
alias vp="$GVIM -f $HOME/.profile && . $HOME/.profile"
alias vip="$GVIM -O "
alias vit="$GVIM -p "
alias sk=". $HOME/.kshrc"
alias sp=". $HOME/.profile"
alias vv="vi $HOME/.vimrc"
alias vg="vi $HOME/.gvimrc"

# File management
alias ls='ls -hF'
alias ll='ls -al'
alias project='gvim +BWProject'
alias eject='disktool -e disk1'

alias port='sudo port'
alias cpan='sudo cpan'
alias gem='sudo gem'
alias cdf='cd "$(posd)"'
alias man='/usr/bin/iman'

growl() { echo -en $'\e]9;'${*}'\007' ; }

# posfind: search the directory frontmost in the Finder
posfind() { find "$(posd)" -name "$@"; }

# posgrep: grep the directory frontmost in the Finder
posgrep() { grep -iIrn "$1" "$(posd)"; }

#alias cl="/Developer/ccl/dppccl'
#alias slime='screen -S slime -t 0 -T xterm -s "-/usr/bin/ksh"'

cd() {
	command cd "$@"
	eval `$HOME/.ksh/shell-env`
}
