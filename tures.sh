#!/bin/bash 
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
rsync -aHinv --delete-during "${exclude_params[@]}" /media/volgrp/media/laptop/ /> result.cc

