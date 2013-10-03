#!/bin/bash
FILE_POSTFIX=$HOME/bashrc/postfix
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
prune_params=();
prune_files=();
find_result="`echo "$3".fww.findresult |sed  -e "s/\//\_/g"`"
if [ -f "$find_result" ]; then
  read -p "the search is already done, if you want to update, press u --> " update
  case $update in
    u)
      ;;
    ?)
      vi "$find_result"
      exit 1
      ;;
  esac
fi
or="";
grep_params="";
if [ -n "$3" ]
then grep_params=" -A"$3" -B"$3;
fi
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
while read suf
do
  prune_files+=( $or "-iname" "$suf" )
  or="-o"
done < "$PRUNE_FILE"
find "$1" "(" "${prune_params[@]}" "${prune_files[@]}" "-o" "-name" "$find_result" ")" -prune -o -iname \*."$2" -exec fgrep -wnH  $grep_params "$3" {} \; > "$find_result"
vi "$find_result"
