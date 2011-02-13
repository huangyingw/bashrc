#!/bin/bash
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" > cscope.files
cscope -bR cscope.files
ctags -R
