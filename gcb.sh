#!/bin/bash

x=`pwd`
echo ${x}
x=`echo ${x} | sed -e "s|$HOME|/media/smb|"`
#x=/media/smb/${x}
echo ${x}

if [ ! -d ".git" ];
then
	echo not a git repo!!!
else
	if [ -d ${x} ];
	then
		echo remote exist!!!
	else
		git clone --bare . ${x}
		git remote rm origin
		git remote add origin ${x}
	fi
fi
