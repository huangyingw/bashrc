#!/bin/bash
function rec_dir() {
for file in `ls $1`
do
  if [ -d $1"/"$file ]
  then
    rec_dir $1"/"$file
  else
    echo $1"/"$file
  fi
done
}
rec_dir .
