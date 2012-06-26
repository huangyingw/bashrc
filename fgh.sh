#!/bin/bash
ls .|while read ss
do
  if [ -d $ss ];
  then
    cd $ss
    if  [ -d ".git" ];
    then   
      $HOME/bashrc/gagh.sh
    fi
    cd ..
  fi
done
