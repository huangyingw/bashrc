#! /bin/bash

RSYNCSOURCE=/pcc/cnbuild/build/output/vmo.isf2_1_pudong_drop2/
mainsource=/pcc/cnbuild/build/output/vmo.mainline/
localmain=/media/volgrp/software/work/platform/cnbuild/vmo.mainline/

BASEDIR=/media/volgrp/software/work/platform/cnbuild/vmo.isf2_1_pudong_drop2/

# check to see if script is already running
PDIR=${0%`basename $0`}
LCK_FILE=`basename $0`.lck

if [ -f "${LCK_FILE}" ]; then
  MYPID=`head -n 1 "${LCK_FILE}"`

  TEST_RUNNING=`ps -p ${MYPID} | grep ${MYPID}`

  if [ -z "${TEST_RUNNING}" ]; then
    # The process is not running
    # Echo current PID into lock file
    echo $$ > "${LCK_FILE}"
    rsync -ahHv --log-file=/root/rlog --delete-after \
      --exclude \*.tar \
      --exclude \*.tar.gz \
      --exclude \*.log \
      --exclude vmo4_1\* \
      --exclude "ego*" \
      --exclude isf-gui.zip \
      --exclude for_test \
      --exclude rfi \
      ${mainsource} ${localmain}
    rsync -ahHv --log-file=/root/rlog --delete-after \
      --exclude \*.tar \
      --exclude \*.tar.gz \
      --exclude \*.log \
      --exclude vmo4_1\* \
      --exclude "isf2_2Agent_linux2.6-x86*" \
      --exclude "ego*" \
      --exclude isf-gui.zip \
      --exclude for_test \
      --exclude rfi \
      ${RSYNCSOURCE} ${BASEDIR}
  else
    # the process IS running
    # handle it
    echo this process is running
    exit 0
  fi
else
  echo $$ > "${LCK_FILE}"
fi

