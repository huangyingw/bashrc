#! /bin/bash
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
  mkdir -p "${TARGET}"
fi

rsync -aH --delete-after \
  --exclude=/proc \
  --exclude=/lost+found \
  --exclude=/media \
  --exclude=/sys \
  "${SOURCE}" "${TARGET}"
