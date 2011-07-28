#!/bin/bash
for ss in `git remote -v |awk '/\(fetch\)$/{print $1}'`
do 
  git branch -a|grep $ss
done
