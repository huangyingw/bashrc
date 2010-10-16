#!/bin/sh
find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
cscope -bk -i cscope.files
ctags -R
