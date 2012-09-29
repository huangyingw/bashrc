#! /bin/sh
file=/home/huangyingw/myproject/git/test_fr/makefile
#sed -i "s/"$1"/"$2"/gi" $file
#sed -i 's/"$1"/"$2"/gi' $file
#sed -i "s#\"$1\"#\"$2\"#gi" $file
sed "s#$1#$2#g" "$file"
