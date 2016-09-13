#!/bin/ksh

green() {
    printf '\001\e[38;5;2m\002%s\001\e[0m\002' "$*"
}

blue() {
    printf '\001\e[38;5;4m\002%s\001\e[0m\002' "$*"
}

sigil() {
    case "$1" in
        :therefor) printf $'\xe2\x88\xb4' ;;
        :lambda) printf $'\xce\xbb' ;;
        :branch) printf $'\xee\x82\xa0' ;;
        *) printf "$" ;;
    esac
}

is_in_git() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

git_branch() {
    typeset branch=$(git branch | grep '^\*' | awk '{print $2}')
    if [ "$branch" = "(detached" -o "$branch" = "(HEAD" ]; then branch="(detached)" ; fi
    printf "$branch"
}

exit_status() {
    if [[ $? == 0 ]]
    then
        printf $'\xf0\x9f\x98\x80  '
    else
        printf $'\xe2\x98\xb9\xef\xb8\x8f  '
    fi
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

# Sigils
# THEREFOR \xe2\xce\xbb
# LAMBDA \xce\xbb
#PS1=$'${PWD#$HOME/\~} $(sigil :dollar) '
#PS1=$'$(git_prompt :a)$(blue $(${PWD#$HOME/\~})) $(sigil :therefor) '
#PS1=$'$(exit_status)$(git_prompt :a)$(blue ${PWD/#$HOME/\~}) $(sigil :therefor) '
PS1=$'$(git_prompt :a)$(blue ${PWD/#$HOME/\~}) $(sigil :therefor) '
#PS1=$'$(git_prompt :a)$(blue ${PWD#$HOME/\~}) $(sigil :dollar) '
PS2="$(sigil :lambda) "
#PS1=$'$(blue $(${PWD#$HOME/\~}))$(git_prompt) \xe2\x88\xb4 '
