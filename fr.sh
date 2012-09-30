#! /bin/sh
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
while read suf
do
  find_params+=( $or "-iname" "*.$suf" )
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
find "$1" "(" "${prune_params[@]}" "${prune_files[@]}" ")" -prune -o "(" "${find_params[@]}" "-o" "-iname" "makefile" ")" -type f | while read -r file
do
  sed -i "s#$2#$3#g" "$file"
done

