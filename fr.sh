#! /bin/sh
#把chart换成bbs 把pro换成grup 
#sed -e 's/chart/bbs/;s/pro/grup/' < /media/volgrp/myproject/git/linux/shell/sed/file
#
##将匹配行中的--open-files-limit=替换为空, 即删除 
#echo "--open-files-limit=1234888" | sed -e "s;--open-files-limit=;;" 
##或 
#echo "--open-file-limit=1234888"|sed -e "s/--open-file-limit=//" 
echo "$1" | sed -e 's/chart/bbs/;s/pro/grup/'
#echo "x"
