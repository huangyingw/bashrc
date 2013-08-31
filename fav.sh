#! /bin/bash
find /media/volgrp/av -type f -mtime -100 -exec ls -rt {} \+|tail -n 100|while read ss
do 
    ftemp=`basename "$ss"`
    ln -s "$ss" /media/volgrp/latest/"$ftemp"
done
