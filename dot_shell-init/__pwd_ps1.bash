#!/bin/bash
# Modified from http://stackoverflow.com/a/1617048/359287
# By Alan Christopher Thomas (http://alanct.com)

__pwd_ps1 ()
{
    typeset status=$?
    begin=""
    homebegin=""
    shortbegin=""
    current=""
    end="${2:-$(pwd)}/" # The unmodified rest of the path.
    end="${end#/}" # Strip the first /
    shortenedpath="$end"

    shopt -q nullglob && NGV="-s" || NGV="-u"
    shopt -s nullglob

    while [[ "$end" ]]
    do
      current="${end%%/*}" # Everything before the first /
      end="${end#*/}" # Everything after the first /

      shortcur="$current"
      for ((i=${#current}-2; i>=0; i--))
      do
        [[ ${#current} -le 20 ]] && [[ -z "$end" ]] && break
        subcurrent="${current:0:i}"
        matching=("$begin/$subcurrent"*) # Array of all files that start with $subcurrent
        (( ${#matching[*]} != 1 )) && break # Stop shortening if more than one file matches
        [[ -z "$end" ]] && shortcur="$subcurrent..." # Add character filler at the end of this string
        [[ -n "$end" ]] && shortcur="$subcurrent+" # Add character filler at the end of this string
      done

      begin="$begin/$current"
      homebegin="$homebegin/$current"
      [[ "$homebegin" =~ ^"$HOME"(/|$) ]] && homebegin="~${homebegin#$HOME}" # Convert HOME to ~
      shortbegin="$shortbegin/$shortcur"
      [[ "$homebegin" == "~" ]] && shortbegin="~" # Use ~ for home
      shortenedpath="$shortbegin/$end"
    done

    shortenedpath="${shortenedpath%/}" # Strip trailing /
    shortenedpath="${shortenedpath#/}" # Strip leading /

    [[ ! "$shortenedpath" =~ ^"~" ]] && printf "/$shortenedpath" # Make sure it starts with /
    [[ "$shortenedpath" =~ ^"~" ]] && printf "$shortenedpath" # Don't use / for home dir

    shopt "$NGV" nullglob # Reset nullglob in case this is being used as a function.
    return $status
}
