#!/bin/bash
if [ ! -z "$1" ];
then
  cd "$1"
fi
folder=`pwd | sed -e 's/\/.*\///g'`
gh=git@github.com:huangyingw/$folder.git
git remote rm gh
git remote add gh ${gh}
