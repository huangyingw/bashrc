#!/bin/bash 
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
    mkdir -p "${TARGET}"
fi

rsync -av --recursive --delete -h --times --links --hard-links \
			--stats --progress \
			--exclude .svn \
			"${SOURCE}" "${TARGET}"

