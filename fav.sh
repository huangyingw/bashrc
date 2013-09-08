#! /bin/bash
if [ -z "$1" ];
then
  echo "Please provide source directory"
  exit 1
fi
find "$1" -type f -mtime -100 -size +700M -exec ls -rt {} \+|tail -n 100|while read ss
do 
    ftemp=`basename "$ss"`
    ln -s "$ss" /media/volgrp/latest/"$ftemp"
done
