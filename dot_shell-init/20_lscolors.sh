#!/bin/sh
### Author: Michael Grubb <michael@grubb.co>
### File: ksh/colors.sh
### Created: 2015-11-04 15:34
### Copyright: © 2015, Michael Grubb.  All rights reserved.
### Description: handle LSCOLORS variable
BLACK="a"
RED="b"
GREEN="c"
YELLOW="d"
BLUE="e"
MAGENTA="f"
CYAN="g"
WHITE="h"
BBLACK="A"
BRED="B"
BGREEN="C"
BYELLOW="D"
BBLUE="E"
BMAGENTA="F"
BCYAN="G"
BWHITE="H"
DEFAULT="x"

#DEFAULTS="exfxcxdxbxegedabagacad"
DIR="${BLUE}${DEFAULT}"
LN="${RED}${DEFAULT}"
SOCK="${GREEN}${DEFAULT}"
PIPE="${YELLOW}${DEFAULT}"
#EXEC="${RED}${DEFAULT}"
EXEC="${GREEN}${DEFAULT}"
#BLK="${BLUE}${CYAN}"
BLK="${BLACK}${MAGENTA}"
CHAR="${BLACK}${WHITE}"
EXECSU="${BLACK}${RED}"
EXECGU="${BLACK}${CYAN}"
DIRWRS="${BLACK}${GREEN}"
DIRWR="${BLACK}${YELLOW}"

LSCOLORS="${DIR}${LN}${SOCK}${PIPE}${EXEC}${BLK}${CHAR}${EXECSU}${EXECGU}${DIRWRS}${DIRWR}"
if [ -x "${HOME}/bin/bsd2linuxcolor" ]
then
  export LS_COLORS=$(~/bin/bsd2linuxcolor $LSCOLORS)
fi
export LSCOLORS
unset DIR LN SOCK PIPE EXEC BLK CHAR EXECSU EXECGU DIRWRS DIRWR
unset BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BBLACK BRED BGREEN BYELLOW BBLUE BMAGENTA BCYAN BWHITE DEFAULT

# vim:sw=2:ts=2:sts=2:et:ai:
