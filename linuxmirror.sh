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
  --exclude /boot/initrd.img-* \
  --exclude /boot/vmlinuz-* \
  --exclude 70-persistent-net.rules \
  "${SOURCE}" "${TARGET}"
