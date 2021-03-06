#!/bin/bash
function rec_dir() {
for file in `ls $1`
do
  if [ -d $1"/"$file ]
  then
    if [ ! -d $1"/"$file"/.git" ]
    then
      rec_dir $1"/"$file
    elif [ -d $1"/"$file"/.git" ]
    then
      cd $1"/"$file
      if  ( git status|grep -q modified: )
      then
        echo `pwd`
      fi 
      cd - 1>/dev/null
    fi
  fi 
done
}
if [ -n "$1" ]
then
  rec_dir $1
else
  rec_dir .
fi
