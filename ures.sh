#!/bin/bash 
URESEX=$HOME/bashrc/ures_ex
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

if [ ! -d "${TARGET}" ];
then   
  mkdir -p "${TARGET}"
fi
rsync -aH --delete-during "${exclude_params[@]}" /media/volgrp/media/laptop/ /
