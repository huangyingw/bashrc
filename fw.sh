#!/bin/bash
build_parameter() {
  toReturns=();
  or=$1;
  while read suf
  do
    toReturns+=( $or "-iname" $2$suf )
    or="-o"
  done < "$3"
  return $toReturns
}
FILE_POSTFIX=$HOME/bashrc/postfix
PRUNE_POSTFIX=$HOME/bashrc/prunefix
PRUNE_FILE=$HOME/bashrc/prunefile
find_params=();
prune_params=();
prune_files=();
or="";
grep_params="";
if [ -n "$3" ]
then grep_params=" -A"$3" -B"$3;
fi
build_parameter "" "*." $FILE_POSTFIX
find_params=$?
build_parameter "" "*." $PRUNE_POSTFIX
prune_params=$?
build_parameter "-o" "" $PRUNE_FILE
prune_files=$?
echo find "$1" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -exec fgrep -wnH  $grep_params "$2" {} \;
