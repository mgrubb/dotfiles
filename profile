#!/bin/ksh

## Setup path information for Fink
#test -r /sw/bin/init.sh && . /sw/bin/init.sh
test -r $HOME/.ksh/functions.ksh && . $HOME/.ksh/functions.ksh
test -r $HOME/.ksh/bashmarks.sh && . $HOME/.ksh/bashmarks.sh

LANG=en_US.UTF-8
ENV="$HOME/.kshrc"

NEW_DIR="$HOME/Library/NewFiles"
LSCOLORS="bxfxgxdxcxahaeabagacad"
CLICOLOR="y"
VIM_APP_DIR=/Applications
VIM_PATH="$VIM_APP_DIR/MacVim.app/Contents/MacOS/Vim"
EDITOR="$HOME/bin/vimedit.sh"
NEWACED="/usr/bin/gvim -p -f"
VISUAL="$EDITOR"
FCEDITOR="$EDITOR"
PAGER="/usr/bin/less"
HISTSIZE=4096
CVSROOT="$HOME/.cvsroot"
CVS_RSH="ssh"
VIMINIT="let b:fromterminal=1|so $HOME/.vimrc"
NOTESDIR="$HOME/Documents/Notes"
ECL_HOME="$HOME/Library/ecl"
export ENV LSCOLORS CLICOLOR VIM_APP_DIR VIM_PATH EDITOR VISUAL FCEDITOR
export PAGER HISTSIZE CVSROOT CVS_RSH NEW_DIR DISTDIR NOTESDIR NEWACED PATH

#PATH="$HOME/bin:$ECL_HOME/bin:$PATH"
add_to_path "$ECL_HOME/bin"
add_to_path "$HOME/bin"


#CCL_DEFAULT_DIRECTORY="/Developer/ccl"
#PLTSCHEME_DIRECTORY="/opt/pltscheme"
#export CCL_DEFAULT_DIRECTORY PLTSCHEME_DIRECTORY

JAVA_HOME="/Library/Java/Home"
export JAVA_HOME

PRIVATE_ASDF_INSTALL_DIR="$HOME/Library/Lisp/"
export PRIVATE_ASDF_INSTALL_DIR

_HOSTNAME="$(hostname -s)"
PS1=$'\e[34m$_HOSTNAME $PWD\e[0m≻ '
case "$TERM" in
	dtterm|xterm*)
		PS1="$PS1"$'\e]2;$USER@$_HOSTNAME $PWD\cg'
		;;
esac

cleanup_functions
