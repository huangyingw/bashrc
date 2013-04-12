#! /bin/bash

list=`p4 opened -c $1 | cut -d# -f1`

for file in $list ;
do
  p4 diff -dwbu $file
done
