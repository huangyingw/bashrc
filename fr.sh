#! /bin/sh
find /home/huangyingw/myproject/git/test_fr -type f | while read -r file
do
  sed -i "s/"$1"/"$2"/gi" $file
done

