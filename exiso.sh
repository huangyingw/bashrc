#! /bin/bash

source=$1

umount -fl /media/cdrom
mount "${source}" /media/cdrom -o loop
target="`echo "${source}" |sed  -e "s/\.iso$/\_iso/g;s/\.ISO$/\_iso/g"`"

mkdir -p "${target}"
rsync -rlptDvH  \
  --stats --progress \
  /media/cdrom/ "${target}" \
  && rm -fv "${source}"
