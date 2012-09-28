#!/bin/bash
function rec_dir() {
for file in `ls $1`
do
  if [ -d $1"/"$file -a ! -d $1"/"$file"/.git" ]
  then
    rec_dir $1"/"$file
  else
    echo $1"/"$file
    cd $1"/"$file
    if  ( git status|grep -q modified: )
    then
      echo `pwd` need to save
    fi 
  fi
done
}
rec_dir .
