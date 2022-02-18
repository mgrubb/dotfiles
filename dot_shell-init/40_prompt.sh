# vim: ft=sh

# Start of Header (\001) and Start of Text(\002)
# being used here to indicate non-printable characters
# for terminals that can use such things

green() {
  typeset status=$?
  printf '\001\e[38;5;2m\002%s\001\e[0m\002' "$*"
  return $status
} 

blue() {
  typeset status=$?
  printf '\001\e[38;5;4m\002%s\001\e[0m\002' "$*"
  return $status
}

italic() {
  typeset status=$?
  printf '\001\e[3m\002%s\001\e[m\002' "$*"
  return $status
}

sigil() {
  typeset status=$?
  case "$1" in
    :therefor) printf $'\xe2\x88\xb4' ;;
    :lambda) printf $'\xce\xbb' ;;
    :delta) printf $'\xf0\x9d\x9a\xab' ;;
    :branch) printf $'\xee\x82\xa0' ;;
    :plbranch) printf $'\xee\x82\xa0' ;;
    :plln) printf $'\xee\x82\xa1' ;;
    :pllock) printf $'\xee\x82\xa2' ;;
    :plcn) printf $'\xee\x82\xa3' ;;
    :pllftfillarrow) printf $'\xee\x82\xb0' ;;
    :pllftarrow) printf $'\xee\x82\xb1' ;;
    :plrgtfillarrow) printf $'\xee\x82\xb2' ;;
    :plrgtarrow) printf $'\xee\x82\xb3' ;;
    :pllftfilldome) printf $'\xee\x82\xb4' ;;
    :pllftdome) printf $'\xee\x82\xb5' ;;
    :plrgtfilldome) printf $'\xee\x82\xb6' ;;
    :plrgtdome) printf $'\xee\x82\xb7' ;;
    :pllftfillangle1) printf $'\xee\x82\xb8' ;;
    :pllftangle1) printf $'\xee\x82\xb9' ;;
    :plrgtfillangle1) printf $'\xee\x82\xba' ;;
    :plrgtangle1) printf $'\xee\x82\xbb' ;;
    :pllftfillangle2) printf $'\xee\x82\xbc' ;;
    :pllftangle2) printf $'\xee\x82\xbd' ;;
    :plrgtfillangle2) printf $'\xee\x82\xbe' ;;
    :plrgtangle2) printf $'\xee\x82\xbf' ;;
    :pllftfillflame) printf $'\xee\x82\c0' ;;
    :pllftflame) printf $'\xee\x82\c1' ;;
    :plrgtfillflame) printf $'\xee\x82\c2' ;;
    :plrgtflame) printf $'\xee\x82\c3' ;;
    :pllftsmblk) printf $'\xee\x82\c4' ;;
    :plrgtsmblk) printf $'\xee\x82\c5' ;;
    :pllftlgblk) printf $'\xee\x82\c6' ;;
    :plrgtlgblk) printf $'\xee\x82\c7' ;;
    :pllftstreak) printf $'\xee\x82\c8' ;;
    :plrgtstreak) printf $'\xee\x82\ca' ;;
    :pllftfillhex) printf $'\xee\x82\cc' ;;
    :pllfthex) printf $'\xee\x82\cd' ;;
    :pllftisolego) printf $'\xee\x82\ce' ;;
    :plisolego) printf $'\xee\x82\cf' ;;
    :plstudlego) printf $'\xee\x82\xd0' ;;
    :pllftlego) printf $'\xee\x82\xd1' ;;
    :pllftbrkt) printf $'\xee\x82\xd2' ;;
    :plrgtbrkt) printf $'\xee\x82\xd4' ;;
    *) printf "$" ;;
  esac
  return $status
}

is_in_git() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

git_branch() {
  typeset status=$?
  typeset branch=$(git branch | grep '^\*' | awk '{print $2}')
  if [ "$branch" = "(detached" -o "$branch" = "(HEAD" ]; then branch="(detached)" ; fi
  printf "$branch"
  return $status
}

exit_status() {
    typeset status=$1
    if [[ $status != 0 ]]
    then
        printf $' \xe2\x9d\x97\xef\xb8\x8f%d' $status
    fi
    return $status
}

git_prompt() {
  typeset status=$?
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
  return $status
}

__pwd_ps1 () {
  typeset status=$?
  echo ${PWD/#$HOME/\~}
  return $status
}

[ -e ${HOME}/.shell-init/__pwd_ps1.bash ] && source ${HOME}/.shell-init/__pwd_ps1.bash

# Sigils
# THEREFOR \xe2\xce\xbb
# LAMBDA \xce\xbb
#PS1=$'${PWD#$HOME/\~} $(sigil :dollar) '
#PS1=$'$(git_prompt :a)$(blue $(${PWD#$HOME/\~})) $(sigil :therefor) '
#PS1=$'$(exit_status)$(git_prompt :a)$(blue ${PWD/#$HOME/\~}) $(sigil :therefor) '
#PS1=$'$(git_prompt :a)$(blue ${PWD/#$HOME/\~}) $(sigil :therefor) '
PS1=$'$(git_prompt :a)$(blue $(italic $(__pwd_ps1)))$(exit_status ${?}) $(sigil :lambda) '
#PS1=$'$(git_prompt :a)$(blue ${PWD#$HOME/\~}) $(sigil :dollar) '
PS2="$(sigil :delta) "
#PS1=$'$(blue $(${PWD#$HOME/\~}))$(git_prompt) \xe2\x88\xb4 '
