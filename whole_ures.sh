#!/bin/bash 
SOURCE=/media/volgrp/media/laptop/
if [ -n "$1" ]
then 
  SOURCE="$1"
fi
URESEX=$HOME/bashrc/whole_ures_ex
URESIN=$HOME/bashrc/ures_in
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
rsync -aH --delete-during "${exclude_params[@]}" "${SOURCE}" /
