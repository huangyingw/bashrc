#!/bin/bash
# this is used to reset back to the latest change on the file.
commit=`git log --all -- "$1" |awk 'NR==1{print $2}'`
cp -fv "$1" "$1".bak \
  && git checkout "$commit" -- "$1"
