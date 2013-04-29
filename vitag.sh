#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
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
while read suf
do
  prune_files+=( $or "-iname" "$suf" )
  or="-o"
done < "$PRUNE_FILE"
find "$PWD" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -a -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -print |sed 's/\(["'\''\]\)/\\\1/g;s/.*/"&"/' > ${TARGET}
cscope -qR -i ${TARGET} 
