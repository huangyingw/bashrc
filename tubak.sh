#! /bin/bash
SOURCE=/media/volgrp/media/laptop/
if [ -n "$1" ]
then 
  SOURCE="$1"
fi
UBAKEX=$HOME/bashrc/ubak_ex
UBAKIN=$HOME/bashrc/ubak_in
exclude_params=();
while read suf
do
  exclude_params+=( "--exclude=$suf" )
done < "$UBAKEX"
include_params=();
while read suf
do
  include_params+=( "--include=$suf" )
done < "$UBAKIN"
rsync -aHinv --delete-during "${exclude_params[@]}" "${include_params[@]}" / "${SOURCE}"|vi -
