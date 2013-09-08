#! /bin/bash
if [ -z "$1" ];
then
  echo "Please provide source directory"
  exit 1
fi
find "$1" -type f -name 9\* |while read ss
do 
    ftemp=`basename "$ss"`
    ln -s "$ss" /media/volgrp/fnine/"$ftemp"
done
