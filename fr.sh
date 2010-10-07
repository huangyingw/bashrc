#! /bin/sh
find $1 \( -name \.svn -o -path \.git -o -name \.hg \) -prune -o \( -name \*\.c -o -name \*\.cc -o -name \*\.h -o -name \*\.sh -o -name YBUILD -o -name [m,M]akefile \) -type f | while read -r file
do
  sed -n "s/$2/$3/gi;p" $file  >> log
  sed -ie "s/$2/$3/gi" $file
done

