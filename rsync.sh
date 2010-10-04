#!/bin/bash 
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
    mkdir -p "${TARGET}"
fi

rsync -aH --delete-after \
		--exclude *.sw* *.orig \
		"${SOURCE}" "${TARGET}"

