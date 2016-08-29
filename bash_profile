#!/bin/ksh
test -r "$HOME/.ksh/functions.ksh" && . "$HOME/.ksh/functions.ksh"
test -r "$HOME/.ksh/lscolors.sh" && . "$HOME/.ksh/lscolors.sh"
test -r "${HOME}/.ksh/prompt.ksh" && . "${HOME}/.ksh/prompt.ksh"
#test -r $HOME/.ksh/bashmarks.sh && . $HOME/.ksh/bashmarks.sh


LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
ENV="$HOME/.kshrc"

NEW_DIR="$HOME/Library/NewFiles"
CLICOLOR="y"
VIM_APP_DIR=/Applications
VIM_PATH="$VIM_APP_DIR/MacVim.app/Contents/MacOS/Vim"
EDITOR="$HOME/bin/vimedit.sh"
EDITOR="/usr/local/bin/emacsclient -c -a ''"
VISUAL="$EDITOR"
FCEDITOR="$EDITOR"
PAGER="/usr/bin/less"
LESS="-R -F"
HISTSIZE=4096
CVSROOT="$HOME/.cvsroot"
CVS_RSH="ssh"
VIMINIT="let b:fromterminal=1|so $HOME/.vimrc"
NOTESDIR="$HOME/Documents/Notes"
ECL_HOME="$HOME/Library/ecl"
RBENV_ROOT="/usr/local/var/rbenv"
#PG90DATA="/opt/local/var/db/postgresql90/defaultdb"
#PGDATA="$PG90DATA"
HOMEBREW_CASK_OPTS="--appdir=/Applications"
GOPATH="$HOME/Source/go"
F5VPN_USETOKEN=y
FINDBUGS_HOME=/usr/local/Cellar/findbugs/3.0.1/libexec
JBOSS_HOME=/usr/local/opt/wildfly-as/libexec
MANPATH=/usr/local/opt/erlang/lib/erlang/man:${MANPATH}
#PARROT_HOME=/opt/parrot
export ENV CLICOLOR VIM_APP_DIR VIM_PATH EDITOR VISUAL FCEDITOR
export PAGER HISTSIZE CVSROOT CVS_RSH NEW_DIR DISTDIR NOTESDIR PATH
export PGDATA LANG LC_ALL LESS RBENV_ROOT HOMEBREW_CASK_OPTS GOPATH F5VPN_USETOKEN FINDBUGS_HOME
export JBOSS_HOME MANPATH

if [ -e "${HOME}/.gpg-agent-info" ]
then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
fi

add_to_path "/Applications/Postgres.app/Contents/Versions/9.4/bin"
#add_to_path "${PARROT_HOME}/bin"
add_to_path "${JBOSS_HOME}/bin"
add_to_path "$GOPATH/bin"
add_to_path "$HOME/bin"

#CCL_DEFAULT_DIRECTORY="/Developer/ccl"
#PLTSCHEME_DIRECTORY="/opt/pltscheme"
#export CCL_DEFAULT_DIRECTORY PLTSCHEME_DIRECTORY

JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME

PRIVATE_ASDF_INSTALL_DIR="$HOME/Library/Lisp/"
export PRIVATE_ASDF_INSTALL_DIR

HOSTNAME="$(uname -n)"


cleanup_functions

# initialize rbenv
if which rbenv > /dev/null ; then eval "$(rbenv init -)" ; fi

. ${HOME}/.bashrc
