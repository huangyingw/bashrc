
#!/bin/bash 
SOURCE=$1
TARGET=$2

if [ ! -d "${TARGET}" ];
then   
    mkdir -p "${TARGET}"
fi

rsync -aHinv --delete-after \
		--exclude .svn --exclude *.swp --exclude *.swo --exclude *.orig \
		"${SOURCE}" "${TARGET}"

