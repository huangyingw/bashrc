#!/bin/bash
if [ -z "$3" ];
then
  find "$1" \( -name \.svn -o -name \.git -o -name \.hg -o -name find.cc \) -prune -o \( \
    -iname \*\.c \
    -o -iname \*\.cc \
    -o -iname \*\.java \
    -o -iname \*\.xml \
    -o -iname \*\.cpp \
    -o -iname \*\.hpp \
    -o -iname \*\.js \
    -o -iname \*\.jsp \
    -o -iname \*\.properties \
    -o -iname \*\.h \
    -o -iname \*\.sh \
    -o -iname \*\.py \
    -o -iname \*\.tag \
    -o -iname \*\.sql \
    -o -iname \*\.xml.model \
    -o -iname YBUILD \
    -o -iname \.gitignore \
    -o -iname [mM]akefile \
    -o -iname \*\.php \
    -o -iname \*\.js \
    -o -iname \*\.css \
    -o -iname \*\.htm \
    -o -iname \*\.html \
    \) \
    -exec fgrep -wnH  "$2" {} \;
else
  find "$1" \( -name \.svn -o -name \.git -o -name \.hg -o -name find.cc \) -prune -o \(  \
    -iname \*\.cc \
    -o -iname \*\.java \
    -o -iname \*\.xml \
    -o -iname \*\.cpp \
    -o -iname \*\.hpp \
    -o -iname \*\.js \
    -o -iname \*\.jsp \
    -o -iname \*\.properties \
    -o -iname \*\.h \
    -o -iname \*\.sh \
    -o -iname \*\.py \
    -o -iname \*\.tag \
    -o -iname \*\.sql \
    -o -iname \*\.xml.model \
    -o -iname YBUILD \
    -o -iname \.gitignore \
    -o -iname [mM]akefile \
    -o -iname \*\.php \
    -o -iname \*\.js \
    -o -iname \*\.css \
    -o -iname \*\.htm \
    -o -iname \*\.html \
    \) \
    -exec  fgrep -wnHA$3 -B$3  "$2" {} \;
fi
