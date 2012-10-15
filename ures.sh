#!/bin/bash 
if [ -z "$1" ];
then
  echo please enter the source path
  exit
fi
if [ -z "$2" ];
then
  echo please enter the target path
  exit
fi
URESEX=./ures_ex
URESIN=./ures_in
exclude_params=();
while read suf
do
  exclude_params+=( "--exclude=$suf" )
done < "$URESEX"
include_params=();
while read suf
do
  include_params+=( "--include=$suf" )
done < "$URESIN"

rsync -aH --delete-during "${exclude_params[@]}" "$1" "$2"
