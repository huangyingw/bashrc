#! /bin/bash

source=$1
target=$2

umount /media/cdrom
mount "${source}" /media/cdrom -o loop
target="${target}`echo "${source}" |egrep -o '[^/]+[.](ISO|iso)'`"

if [ -d "${target}" ];
then   
    echo dir exists
else
 		mkdir -p "${target}"
		rsync -av --recursive --delete -h --times --links --hard-links \
			--stats --progress \
			/media/cdrom/ "${target}" \
		&& rm -frv "${source}"
		#echo dir does not exists
fi  




