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
alias pl='perl'
alias rk='rake'

# Screen stuff
alias sd='screen -d'
alias sr='screen -r -A -O'
alias sl='screen -list'

# Vi stuff
GVIM='/usr/bin/gvim'
#alias vi="$GVIM --remote-silent"
#alias vk="$GVIM --remote-wait-silent $HOME/.kshrc && . $HOME/.kshrc"
#alias vp="$GVIM --remote-wait-silent $HOME/.profile && . $HOME/.profile"
#alias vi="$GVIM -c 'au VimLeave * call system(\"open -a iTerm\")'"
alias vi="$GVIM"
alias vi!='/usr/bin/vi'
alias svi='sudo -e'
alias vim='/usr/bin/vim'
alias vk="$GVIM -f $HOME/.kshrc && . $HOME/.kshrc"
alias vp="$GVIM -f $HOME/.profile && . $HOME/.profile"
alias vit="$GVIM -p "
alias vis="$GVIM -O "
alias sk=". $HOME/.kshrc"
alias sp=". $HOME/.profile"
alias vv="vi $HOME/.vimrc"
alias vg="vi $HOME/.gvimrc"

# File management
alias ls='ls -hF'
alias ll='ls -al'
alias project='gvim +BWProject'
alias eject='disktool -e disk1'
alias z='dtrx'

# Use hub extension to git
alias git='hub'

alias port='sudo port'
alias cpan='sudo cpan'
#alias gem='sudo gem'
alias cdf='cd "$(posd)"'
#alias man='/usr/bin/iman'
alias xml='/opt/local/bin/xmlstarlet'
alias be='bundle exec'
alias guard='be guard'

man() {
  man=$1
  sect=$(echo $2 | sed -e 's/\(.\{1,\}\)/(\1)/')
  open "dash://manpages:$man$sect"
}

growl() { echo -en $'\e]9;'${*}'\007' ; }

# posfind: search the directory frontmost in the Finder
posfind() { find "$(posd)" -name "$@"; }

# posgrep: grep the directory frontmost in the Finder
posgrep() { grep -iIrn "$1" "$(posd)"; }

#alias cl="/Developer/ccl/dppccl'
#alias slime='screen -S slime -t 0 -T xterm -s "-/usr/bin/ksh"'

function cd {
  # support bashmarks in-line
  typeset isbkm=$(p ${1%%/*})
  if [ $# -gt 1 -o -d "$1" -o "$1" = "-" -o -z "$isbkm" ]
  then
    command cd "$@"
  else
    g "$@"
  fi

	echo -ne "\033]50;CurrentDir=`pwd`\a"
	eval `$HOME/.ksh/shell-env`
}

gitc() {
	git config -f "$HOME/.dotfiles/gitconfig.erb" "$@" && \
	(cd $HOME/.dotfiles; rake file[gitconfig.erb,force])
}

typeset -A Keytable
trap 'eval "${Keytable[${.sh.edchar}]}"' KEYBD
function keybind # key [action]
{
	typeset key=$(print -f "%q" "$2")
	case $# in
		2)	Keytable[$1]=' .sh.edchar=${.sh.edmode}'"$key"
			;;
		1)	unset Keytable[$1]
			;;
		*)	print -u2 "Usage: $0 key [action]"
			return 2 # usage errors return 2 by default
			;;
	esac
}
