#! /bin/bash

RSYNCSOURCE=/pcc/cnbuild/build/output/vmo.isf2_1_pudong

BASEDIR=/media/storage/work/platform/cnbuild/build/output/vmo.isf2_1_pudong/
PURAN=180.168.35.141:/root/backup/vmo.isf2_1_pudong/
PATCHSOURCE=/home/huangyingw/forTcloudCustom/
PATCHTARGET=180.168.35.141:/root/forTcloudCustom/
oracle_xa=/home/yhzhang/scratch/tools/oracle_linux/
oracle_local_xa=/media/storage/software/oracle/oracle_linux/
oracle_local=/media/storage/software/oracle/
oracle_remote=180.168.35.141:/root/software/oracle/

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
      --exclude isf2_1Manager_linux2.6-x86.bin \
      --exclude "isf2_1Agent_linux2.6-x86*" \
      --exclude "ego*" \
      --exclude isf-gui.zip \
      --exclude for_test \
      --exclude rfi \
      ${RSYNCSOURCE} ${BASEDIR}
    rsync -ahHv -e ssh --log-file=/root/rlog --delete-after \
      --exclude \*.tar \
      --exclude \*.tar.gz \
      --exclude \*.log \
      --exclude vmo4_1\* \
      --exclude isf2_1Manager_linux2.6-x86.bin \
      --exclude "isf2_1Agent_linux2.6-x86*" \
      --exclude "ego*" \
      --exclude isf-gui.zip \
      --exclude for_test \
      --exclude rfi \
      ${BASEDIR} ${PURAN}
    rsync -ahHv -e ssh --log-file=/root/rlog --delete-after \
      ${PATCHSOURCE} ${PATCHTARGET}
    rsync -ahHv -e ssh --log-file=/root/rlog --delete-after \
      ${oracle_xa} ${oracle_local_xa}
    rsync -ahHv -e ssh --log-file=/root/rlog --delete-after \
      ${oracle_local} ${oracle_remote}
  else
    # the process IS running
    # handle it
    echo this process is running
    exit 0
  fi
else
  echo $$ > "${LCK_FILE}"
fi

