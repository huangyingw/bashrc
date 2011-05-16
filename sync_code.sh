#! /bin/bash
PDIR=${0%`basename $0`}
LCK_FILE=`basename $0`.lck

if [ -f "${LCK_FILE}" ]; then
  MYPID=`head -n 1 "${LCK_FILE}"`

  TEST_RUNNING=`ps -p ${MYPID} | grep ${MYPID}`

  if [ -z "${TEST_RUNNING}" ]; then
    # The process is not running
    # Echo current PID into lock file
    echo $$ > "${LCK_FILE}"
    rsync -aH --delete-after /media/volgrp/myproject/git/work/platform/cvs/ /home/yhuang/scratch/cvs/
  else
    # the process IS running
    # handle it
    echo this process is running
    exit 0
  fi
else
  echo $$ > "${LCK_FILE}"
fi

