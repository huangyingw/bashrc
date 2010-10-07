#!/bin/bash 
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
    mkdir -p "${TARGET}"
fi

rsync -aH --delete-after \
		--exclude .svn --exclude *.sw* *.orig \
		"${SOURCE}" "${TARGET}"

