#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix.bak
PRUNE_POSTFIX=$HOME/bashrc/prunefix
find_params=();
or="";
prune_params=();
while read suf
do
  find_params+=( $or "-name" "*.$suf" )
  or="-o"
done < "$FILE_POSTFIX"
or="";
while read suf
do
  prune_params+=( $or "-iname" "*.$suf" )
  or="-o"
done < "$PRUNE_POSTFIX"
find "$PWD" "(" "${prune_params[@]}" "-o" "-iname" "find.cc" ")" -a -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -print
#find "$PWD" "${prune_params[@]}" -prune -o "${find_params[@]}" -o -iname makefile |sed 's/\(["'\''\]\)/\\\1/g;s/.*/"&"/' > ${TARGET}
#cscope -kqR -i ${TARGET} 
