#!/bin/bash
function rec_dir() {
for file in `ls $1`
do
  if [ -d $1"/"$file ]
  then
    if [ ! -d $1"/"$file"/.git" ]
    then
      rec_dir $1"/"$file
    else
      cd $1"/"$file
      if  ( git status|grep -q modified: )
      then
        echo `pwd` need to checkin
      fi 
      cd $1
    fi
  fi 
done
}
rec_dir .
