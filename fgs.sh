#!/bin/bash
ls .|while read ss
do
  if [ -d $ss ];
  then
    cd $ss
    if  [ -d ".git" ];
    then   
      if  ( git status|grep -q modified: )
      then
        echo `pwd` need to save
      fi
    else
      echo `pwd` need to init
    fi
    cd ..
  fi
done
