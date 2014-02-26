#!/bin/bash
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
prune_params=();
find_result="`echo "$2".ff.findresult |sed  -e "s/\//\_/g"`"
if [ -f "$find_result" ]; then
  read -p "the search is already done, if you want to update, press u --> " update
  case $update in
    u)
      ;;
    ?)
      echo exit now
      exit 1
      ;;
  esac
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
find -L "$1" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -prune -type f -o -iname "$2" -print > "$find_result"
vi "$find_result"
