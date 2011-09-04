#!/bin/bash
FILE_TYPE=$HOME/bashrc/file_type
command_params=`cat ${FILE_TYPE}|{ read suf; echo -n "--include=*.$suf";while read suf;do echo -n " --include=*.$suf";done; }`
rsync -avH --include=*/  $command_params --exclude=* --prune-empty-dirs  /media/comprehensive/storage/learning/English/ /media/usb/storage/learning/English/
