#!/bin/bash
if [ -z "$3" ];
then
		find "$1" \( -name \.svn -o -name \.git -o -name \.hg -o -name find.cc \) -prune -o \( \
      -name \*\.c \
      -o -name \*\.cc \
      -o -name \*\.java \
      -o -name \*\.xml \
      -o -name \*\.cpp \
      -o -name \*\.hpp \
      -o -name \*\.js \
      -o -name \*\.jsp \
      -o -name \*\.properties \
      -o -name \*\.h \
      -o -name \*\.sh \
      -o -name \*\.py \
      -o -name YBUILD \
      -o -name \.gitignore \
      -o -name [mM]akefile \
 \) \
 -exec fgrep -wnH  "$2" {} \;
else
		find "$1" \( -name \.svn -o -name \.git -o -name \.hg -o -name find.cc \) -prune -o \(  \
      -o -name \*\.cc \
      -o -name \*\.java \
      -o -name \*\.xml \
      -o -name \*\.cpp \
      -o -name \*\.hpp \
      -o -name \*\.js \
      -o -name \*\.jsp \
      -o -name \*\.properties \
      -o -name \*\.h \
      -o -name \*\.sh \
      -o -name \*\.py \
      -o -name YBUILD \
      -o -name \.gitignore \
      -o -name [mM]akefile \
 -exec  fgrep -wnHA$3 -B$3  "$2" {} \;
fi
