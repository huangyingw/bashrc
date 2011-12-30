#!/bin/bash 
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
  mkdir -p "${TARGET}"
fi

rsync -aH --delete-during \
  --exclude fstab \
  --exclude grub.cfg \
  --exclude hosts \
  --exclude hostname \
  "${SOURCE}" "${TARGET}"
