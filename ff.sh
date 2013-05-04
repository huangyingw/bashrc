#!/bin/bash

UPDATE=
while getopts u OPTION
do
  case $OPTION in
    u)
      UPDATE=true
      ;;
  esac
done

PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
prune_params=();
find_result="`echo "$2".ff.findresult |sed  -e "s/\//\_/g"`"
echo $UPDATE
if [[ ! $UPDATE ]] && [[ -f "$find_result" ]]; then
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
find "$1" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -prune -type f -o -iname "$2" > "$find_result"
if [ ! $UPDATE ]; then
  vi "$find_result"
fi
