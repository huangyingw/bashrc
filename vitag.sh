#!/bin/bash
TARGET='/export/home1/username/cscope_db/'`pwd |sed -e "s/^.*\///g"`
echo $TARGET
FILE_POSTFIX=$HOME/bashrc/cscope_postfix
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
PARA=-bR
OS=`uname`
if [ $OS == "Linux" ]
then
  PARA=-qbR
fi
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
find -L "$PWD" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -a -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -type f -print |sed 's/\(["'\''\]\)/\\\1/g;s/.*/"&"/' > ${TARGET}
cscope $PARA -i ${TARGET} 
vi ${TARGET}
