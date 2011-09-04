#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix
find `pwd`/ -type f \
  -name \*log\* \
  |sed 's/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/' \
  > ${TARGET}
cscope -kqR -i ${TARGET} 
