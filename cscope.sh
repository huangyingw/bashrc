#!/bin/bash
if [ -z "$1" ];
then
  TARGETEDIR="$PWD"
else
  TARGETEDIR="$1"
fi
cd "$TARGETEDIR"
TARGET='/export/home1/username/cscope_db/'`pwd |sed -e "s/^.*\///g"`
echo $TARGET
if [ -f "$HOME/bashrc/work_prunefix" ];
then
  PRUNE_POSTFIX="$HOME/bashrc/work_prunefix"
else
  PRUNE_POSTFIX="$HOME/bashrc/prunefix"
fi
if [ -f "$HOME/bashrc/work_prunefile" ];
then
  PRUNE_FILE="$HOME/bashrc/work_prunefile"
else
  PRUNE_FILE="$HOME/bashrc/prunefile"
fi
PARA=-bqR
prune_params=();
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
find -L "$TARGETEDIR" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -a -prune -o -type f -size -1M -print |sed 's/\(["'\''\]\)/\\\1/g;s/.*/"&"/' > ${TARGET}
cscope $PARA -i ${TARGET} 
read -p "press any key to continue...." update
