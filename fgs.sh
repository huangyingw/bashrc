#!/bin/bash
if [ -z "$1" ];
then
  path=.
else
  path="$1"
fi
find "$path" -maxdepth 1 -type d|while read ss
do
  cd $ss
  if  [ -d ".git" ] && [git status|grep -q modified: ];
  then   
    pwd
  fi
  cd ..
done
