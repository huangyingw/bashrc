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
  --exclude mdadm.conf \
  #--exclude /boot/initrd.img-* \
  #--exclude /boot/vmlinuz-* \
  --exclude /var/lib/mldonkey/temp/ \
  --exclude 70-persistent-net.rules \
  --exclude interfaces \
  --exclude /etc/initramfs-tools/conf.d/resume \
  "${SOURCE}" "${TARGET}"
