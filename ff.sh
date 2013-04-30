#!/bin/bash
update=false
while getopts ab: name
do
  case $name in
    u)     update=true;;
esac
done
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
prune_params=();
find_result="`echo "$2".file.findresult |sed  -e "s/\//\_/g"`"
echo $update
if [ ! $update ] && [ -f "$find_result" ]; then
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
