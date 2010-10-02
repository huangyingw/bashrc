#! /bin/sh
find "$1" \( -name \.svn -o -name \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h -o -name \*\.sh -o -name YBUILD -o -name [m,M]akefile \) -exec grep -wnH  "$2" {} \;
find "$1" \( -name \.git -o -name \.svn -o -name \.hg -o -path \/media\/smb \) -prune -type f -o -name "$2"
echo "$1" | sed -e 's/chart/bbs/;s/pro/grup/'
#echo "x"
/root/myproject/git/c_c++/googletest/
