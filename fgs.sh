#!/bin/bash
ls .|while read ss
do
  cd $ss
  if  (git status|grep -q modified:)
  then   
    pwd
  fi
  cd ..
done
