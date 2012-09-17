#!/bin/bash
FILE_POSTFIX=$HOME/bashrc/postfix
PRUNE_POSTFIX=$HOME/bashrc/prunefix
find_params=();
prune_params=();
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
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
find "$1" "(" "${prune_params[@]}" "-o" "-iname" "find.cc" ")" -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -exec fgrep -wnH  $grep_params "$2" {} \;
