#!/bin/bash
PRUNE_POSTFIX=$HOME/bashrc/prunefix
prune_params=();
find_result="$2".findresult
if [ -f "$find_result" ]; then
  echo the search is already done, if you want to update, please delete the findresult file first
  exit 1
fi
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
find "$1" "(" "${prune_params[@]}" ")" -prune -type d -o -iname "$2" -print > "$find_result"
vi "$find_result"
