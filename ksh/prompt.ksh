#!/bin/ksh

green() {
  printf '\e[38;5;2m%s\e[0m' "$*"
}

blue() {
  printf '\e[38;5;4m%s\e[0m' "$*"
}

sigil() {
  case "$1" in
    :therefor) printf $'\xe2\x88\xb4' ;;
    :lambda) printf $'\xce\xbb' ;;
    :branch) printf $'\xe2\xad\xa0' ;;
    *) printf "$" ;;
  esac
}

is_in_git() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

git_branch() {
  typeset branch=$(git branch | grep '^\*' | awk '{print $2}')
  if [ "$branch" = "(detached" ]; then branch="(detached)" ; fi
  printf "$branch"
}

git_prompt() {
  if is_in_git
  then
    typeset sigil="$(sigil :branch)"
    typeset sigil1="$sigil "
    typeset sigil2=" $sigil "
    if [ "$1" = ":a" ]
    then
      sigil1=""
    else
      sigil2=""
    fi
    printf $'%s%s%s' "$sigil1" $(green $(git_branch)) "$sigil2"
  fi
}

pspwd() {
  typeset cwd=""
  if [ -n "$KSH_VERSION" ]
  then
    cwd="${PWD/#$HOME/\~}"
  else
    cwd="${PWD/#$HOME/~}"
  fi
  printf "$cwd"
}

# Sigils
# THEREFOR \xe2\xce\xbb
# LAMBDA \xce\xbb
PS1=$'$(git_prompt :a)$(blue $(pspwd)) $(sigil :therefor) '
PS2="$(sigil :lambda) "
#PS1=$'$(blue $(pspwd))$(git_prompt) \xe2\x88\xb4 '
