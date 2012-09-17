#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix
find_params=(); or="";
while read suf
do
  find_params+=( $or "-name" "*.$suf" )
  or="-o"
done < "$FILE_POSTFIX"
find "$PWD" "${find_params[@]}" -o -iname makefile |sed 's/\(["'\''\]\)/\\\1/g;s/.*/"&"/' > ${TARGET}
cscope -kqR -i ${TARGET} 
