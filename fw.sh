#!/bin/bash
if [ -z "$3" ];
then
  find "$1" \( -name \.svn -o -name \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h -o -name \*\.hpp -o -name \*\.cpp -o -name \*\.sh -o -name \*\.py -o -name YBUILD -o -name [m,M]akefile \) -exec grep -nHE "^((|.)$2|(/[^/]|[^/].).*$2).*" {} \;
else
		find "$1" \( -name \.svn -o -name \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h  -o -name \*\.hpp -o -name \*\.cpp -o -name \*\.sh -o -name \*\.py -o -name YBUILD -o -name [m,M]akefile \) -exec  grep -wnHA$3 -B$3  "$2" {} \;
fi
