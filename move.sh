#!/bin/bash
SOURCE=$1
TARGET=$2

if [ "$SOURCE" != "$TARGET" ]
then
  if [ ! -d "$TARGET" ];
  then   
    mkdir -p "$TARGET"
  fi

  rsync -aH \
    "$SOURCE" "$TARGET" \
    && rsync -aH \
    "$SOURCE" "$TARGET" \
    && rm -fr "$SOURCE"
else
  echo "please choose the different dir!"
fi
