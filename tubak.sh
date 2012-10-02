#! /bin/bash
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
i=0
for x in "${exclude_params[@]}"; do echo $((i++)) "'$x'"; done
i=0
for x in "${include_params[@]}"; do echo $((i++)) "'$x'"; done
rsync -aHinv --delete-during "${exclude_params[@]}" "${include_params[@]}" / /media/volgrp/media/laptop/|vi -
