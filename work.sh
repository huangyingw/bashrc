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
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/etc/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/etc/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/lib/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/lib/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/bin/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86/bin/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/bin/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/bin/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/etc/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/etc/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/lib/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/linux2.6-glibc2.3-x86_64/lib/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/etc/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/etc/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/bin/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/bin/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/lib/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x86/lib/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/etc/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/etc/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/bin/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/bin/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/lib/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/vmo_monte_ext/egoagent/2.0/win-x64/lib/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/3rdparty/jdk/1.5.0_08/linux-x86/ /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/3rdparty/jdk/1.5.0_08/linux-x86/
    rsync --log-file=/root/rlog -aH --delete-after \
       /pcc/app/Linux_jdk1.5.0_08_x86/ /media/volgrp/myproject/git/work/platform/pcc/app/Linux_jdk1.5.0_08_x86/
    rsync --log-file=/root/rlog -aH --delete-after \
      /pcc/lsfqa-trusted/perf_ext/shared/isf2_1_pudong_drop_2/  /media/volgrp/myproject/git/work/platform/pcc/lsfqa-trusted/perf_ext/shared/isf2_1_pudong_drop_2/
    rsync --log-file=/root/rlog -aH --delete-after \
        /pcc/app/apache-ant-1.6.0/  /media/volgrp/myproject/git/work/platform/pcc/app/apache-ant-1.6.0/
    rsync --log-file=/root/rlog -aH --delete-after \
      #/media/volgrp/myproject/git/work/platform/pcc/  172.20.38.125:/pcc/
  else
    # the process IS running
    # handle it
    echo this process is running
    exit 0
  fi
else
  echo $$ > "${LCK_FILE}"
fi

