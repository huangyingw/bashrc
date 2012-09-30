#! /bin/bash
UBAK=$HOME/bashrc/ubak
exclude_params=();
while read suf
do
  exclude_params+=( " --exclude=$suf" )
  or="-o"
done < "$UBAK"
echo rsync -aH --delete-during "${exclude_params[@]}" --include=myproject / /media/volgrp/media/laptop/
