#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
FILE_POSTFIX=$HOME/bashrc/postfix
echo eval find $(cat ${FILE_POSTFIX}|{ read suf; echo -n "-name '*.$suf'";while read suf;do echo -n " -o -name '*.$suf'";done; })|sed 's/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/'
#eval find $(cat ${FILE_POSTFIX}|{ read suf; echo -n "-name '*.$suf'";while read suf;do echo -n " -o -name '*.$suf'";done; })|sed 's/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/' > ${TARGET}
#cscope -kqR -i ${TARGET} 
