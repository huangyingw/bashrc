#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix
command_params=`cat ${FILE_POSTFIX}|{ read suf; echo -n "-name '*.$suf'";while read suf;do echo -n " -o -name '*.$suf'";done; }`
eval find `pwd`/ $command_params -o -iname makefile |sed 's/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/' > ${TARGET}
cscope -kqR -i ${TARGET} 
