#! /bin/sh
#find "$1" \( -name \.svn -o -name \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h -o -name \*\.sh -o -name YBUILD -o -name [m,M]akefile \) -exec sed -e 's/chart/bbs/;s/pro/grup/' {} \;
find $1 \( -name \.svn -o -name \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h -o -name \*\.sh -o -name YBUILD -o -name [m,M]akefile \) -exec sed -ie "s/$2/$3/gi" {} >>log \;
