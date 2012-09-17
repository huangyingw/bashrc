#!/bin/bash
FILE_POSTFIX=$HOME/bashrc/postfix
find_params=(); or="";
while read suf
do
  find_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$FILE_POSTFIX"
find "$1" "(" "${find_params[@]}" ")" -exec fgrep -wnH  "$2" {} \;
