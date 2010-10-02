#! /bin/bash

RSYNCSOURCE=rsync://mirrors.sohu.com/ubuntu/
#RSYNCSOURCE=rsync://debian.nctu.edu.tw/ubuntu/
#RSYNCSOURCE=rsync://ubuntu.dormforce.net/ubuntu/
#RSYNCSOURCE=rsync://mirror.anl.gov/ubuntu/

BASEDIR=/media/volgrp/UbuntuMirror/

if [ "$(ps -p `cat /tmp/program.lock` | wc -l)" -gt 1 ]; then
          # process is still running
          echo "$0: quit at start: lingering process `cat /tmp/program.lock`"
          exit 0
else
      	  echo " $0: orphan lock file warning. Lock file deleted."
      	  echo $$ > /tmp/program.lock
    rsync -ahHv --log-file=/root/rlog --delete-after \
      --exclude \*dapper\* --exclude \*hardy\* --exclude \*intrepid\* --exclude \*jaunty\* \
      --exclude \*powerpc\* --exclude \*sparc\* \
    ${RSYNCSOURCE} ${BASEDIR}
fi

