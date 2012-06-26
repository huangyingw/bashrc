#!/bin/bash
folder=`pwd | sed -e 's/\/.*\///g'`
gh=git@github.com:huangyingw/$folder.git
#git remote rm gh
git remote add gh ${gh}
