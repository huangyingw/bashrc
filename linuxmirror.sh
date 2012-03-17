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
  --exclude 70-persistent-net.rules \
  --exclude interfaces \
  "${SOURCE}" "${TARGET}"
