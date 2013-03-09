#!/bin/bash
PRUNE_POSTFIX=$HOME/bashrc/prunefix
prune_params=();
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
find "$1" "(" "${prune_params[@]}" ")" -prune -type f -o -iname "$2"
