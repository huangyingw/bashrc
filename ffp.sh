#!/bin/bash
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
prune_params=();
find_result="`echo "$2".file.findresult |sed  -e "s/\//\_/g"`"
if [ -f "$find_result" ]; then
  echo the search is already done, if you want to update, please delete the "$find_result" file first
  exit 1
fi
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
while read suf
do
  prune_files+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_FILE"
find "$1" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -prune -type f -o -ipath *"$2" > "$find_result"
vi "$find_result"
