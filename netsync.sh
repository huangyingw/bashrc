#!/bin/bash 
TARGET=thinkpad
if [ -n "$2" ]
then 
  TARGET="$2"
fi
echo $TARGET
NETSYNC="$HOME/bashrc/netsync_ex"
exclude_params=();
while read suf
do
  exclude_params+=( "--exclude=$suf" )
done < "$NETSYNC"
rsync -e ssh -aH --delete-during "${exclude_params[@]}" / "${TARGET}":/
