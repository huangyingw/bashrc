#!/bin/bash
TARGET='/export/home1/username/cscope_db/cscope.files'
find `pwd`/ -type f -name "*.h" \
  -o -name "*.py" \
  -o -name "*.xml" \
  -o -name "*.properties" \
  -o -name "*.jsp" \
  -o -name "*.c" \
  -o -name "*.cc" \
  -o -name "*.cpp" \
  -o -name "*.hpp" \
  -o -name "*.java" \
  -o -name "*.js" \
  |sed 's/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/' \
> ${TARGET}
cscope -kqR -i ${TARGET} 
