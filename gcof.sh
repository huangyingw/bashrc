#!/bin/bash
commit=`git log --all -- "$1" |awk 'NR==1{print $2}'`
git co "$commit" -- "$1"
