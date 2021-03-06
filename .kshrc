#!/bin/ksh

case $- in
  *i*) ;;
  *) return 0;;
esac

set -o vi
[ -n "$KSH_VERSION" ] && set -o viraw

case $TERM in
  screen) export TERM=dtterm ;;
esac

alias r='fc -s'
# Launch apps
alias sg='launch /Developer/Applications/SmartGit.app'
alias pl='perl'
alias rk='rake'
alias plcat='plutil -convert xml1 -o -'

# Screen stuff
alias sd='screen -d'
alias sr='screen -r -A -O'
alias sl='screen -list'
alias tls='tmux list-sessions'
alias tla='tmux attach'

# Vi stuff
GVIM='/usr/local/bin/mvim'
#alias vi="$GVIM --remote-silent"
#alias vk="$GVIM --remote-wait-silent $HOME/.kshrc && . $HOME/.kshrc"
#alias vp="$GVIM --remote-wait-silent $HOME/.profile && . $HOME/.profile"
#alias vi="$GVIM -c 'au VimLeave * call system(\"open -a iTerm\")'"
alias gvim="$GVIM"
#alias vi="$GVIM"
#alias vi!='/usr/bin/vi'
#alias svi='sudo -e'
alias emacs='ec -n'
#alias vi='emacs '
alias vi='vimr '
#alias vim='/usr/local/bin/mvim'
alias vim='/usr/local/bin/vimr'
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
alias project='gvim +BWProject '
alias eject='diskutil eject'
alias z='dtrx '
alias cat='bat '


alias tar='gtar '
alias bu='brew update'
alias bup='brew upgrade && brew cleanup'
alias bd='brew desc'

# Use hub extension to git
alias git='hub '

alias port='sudo port '
alias cpan='sudo cpan '
#alias gem='sudo gem'
alias cdf='cd "$(posd)"'
#alias man='/usr/bin/iman'
alias xml='/opt/local/bin/xmlstarlet'
alias be='bundle exec '
alias guard='bundle exec guard'
alias vssh='vagrant ssh'
#alias cd='cdenh'
alias pio='platformio'

alias dc='docker-compose'
alias vbox='VBoxManage'
alias kp='kitchen'

#function man {
#  man=$1
#  sect=$(echo $2 | sed -e 's/\(.\{1,\}\)/(\1)/')
#  open "dash://man:$man$sect"
#}

function growl { echo -en $'\e]9;'${*}'\007' ; }

# posfind: search the directory frontmost in the Finder
function posfind { find "$(posd)" -name "$@"; }

# posgrep: grep the directory frontmost in the Finder
function posgrep { grep -iIrn "$1" "$(posd)"; }

#alias cl="/Developer/ccl/dppccl'
#alias slime='screen -S slime -t 0 -T xterm -s "-/usr/bin/ksh"'

#function cdenh {
#  # support bashmarks in-line
#  typeset isbkm=$(p ${1%%/*})
#  if [ $# -gt 1 -o -d "$1" -o "$1" = "-" -o -z "$isbkm" ]
#  then
#    command 'cd' "$@"
#  else
#    g "$@"
#  fi
#	#eval `$HOME/.ksh/shell-env`
#}

#function emacs {
#  /usr/local/bin/emacs "$@" &
#}
#
#function vi {
#  emacs "$@"
#}

function gitc {
  git config -f "$HOME/.dotfiles/gitconfig.erb" "$@" && \
    (cd $HOME/.dotfiles; rake file[gitconfig.erb,force])
}

function canREPL {
  if [[ -e ./project.clj && \
      ! -e ./target/repl-port && \
      ! -e ./target/repl/repl-port && \
      ! -e ./.nrepl-port ]]
  then
    return 0
  else
    echo "Not in a clojure project or REPL session already exists." >&2
    return 1
  fi
}

function trepl {
  if canREPL
  then
    tmux new-session -d 'lein repl'
  fi
}

# Run a lein repl in tmux if at the root of a clojure project
# so long as there isn't an existing repl.
function vil {
  if canREPL
  then
    trepl
    vi $@
  fi
}

function repl {
  if canREPL
  then
    lein repl
  fi
}

function flushdns {
  sudo discoveryutil udnsflushcaches
}
#if [ -n "$KSH_VERSION" ]
#then
#typeset -A Keytable
#trap 'eval "${Keytable[${.sh.edchar}]}"' KEYBD
#function keybind # key [action]
#{
#	typeset key=$(print -f "%q" "$2")
#	case $# in
#		2)	Keytable[$1]=' .sh.edchar=${.sh.edmode}'"$key"
#			;;
#		1)	unset Keytable[$1]
  #			;;
#		*)	print -u2 "Usage: $0 key [action]"
  #			return 2 # usage errors return 2 by default
  #			;;
  #	esac
  #}
  #fi
