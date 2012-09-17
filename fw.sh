#!/bin/bash
FILE_POSTFIX=$HOME/bashrc/postfix
find_params=();
or="";
grep_params="";
if [ -n "$3" ]
then grep_params=" -A"$3" -B"$3;
fi
while read suf
do
  find_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$FILE_POSTFIX"
find "$1" "(" "${find_params[@]}" ")" -exec fgrep -wnH  $grep_params "$2" {} \;
