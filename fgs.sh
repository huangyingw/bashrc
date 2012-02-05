#!/bin/bash
if [ -z "$1" ];
then
  path=.
else
  path="$1"
fi
find "$path" -type d|while read ss
do
  #if  [ -d ".git" ] && [git status|grep -q modified: ];
  if  [ -d "$ss/.git" ];
  then   
    cd $ss
    pwd
    cd -
  fi
done
