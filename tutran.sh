#!/bin/bash 
SOURCE=/media/volgrp/slink/media/`hostname`/  
TARGET=/
if [ -n "$1" ]
then 
  SOURCE="$1"
fi
if [ -n "$2" ]
then 
  TARGET="$2"
fi
echo $SOURCE
echo $TARGET
UTRANEX="$HOME/bashrc/utran_ex"
UTRANIN="$HOME/bashrc/utran_in"
exclude_params=();
while read suf
do
  exclude_params+=( "--exclude=$suf" )
done < "$UTRANEX"
include_params=();
while read suf
do
  include_params+=( "--include=$suf" )
done < "$UTRANIN"
rsync -aHinv --delete-during "${exclude_params[@]}" "${SOURCE}" "${TARGET}"> find.cc
vi find.cc