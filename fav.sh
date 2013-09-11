#! /bin/bash
if [ -f $HOME/bashrc/fileDir ]; then
  FAV=`cat $HOME/bashrc/fileDir |grep fav|awk '{print $3}'`
fi
rm /media/volgrp/latest/*
find "$FAV" -type f -mtime -100 -size +700M -exec ls -rt {} \+|tail -n 100|while read ss
do 
    ftemp=`basename "$ss"`
    ln -s "$ss" /media/volgrp/latest/"$ftemp"
done
