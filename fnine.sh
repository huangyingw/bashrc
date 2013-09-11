#! /bin/bash
if [ -f $HOME/bashrc/fileDir ]; then
  FAV=`cat $HOME/bashrc/fileDir |grep fav|awk '{print $3}'`
fi
rm /media/volgrp/fnine/*
find "$FAV" -type f -size +700M -name 9\* |while read ss
do 
    ftemp=`basename "$ss"`
    ln -s "$ss" /media/volgrp/fnine/"$ftemp"
done
