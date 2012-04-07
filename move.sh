#!/bin/bash
case "$1" in
  */)
    SOURCE=$1
    ;;
  *)
    SOURCE=$1"/"
    ;;
esac
echo $SOURCE
TARGET=$2

#if [ "$SOURCE" != "$TARGET" ]
#then
#  if [ ! -d "$TARGET" ];
#  then   
#    mkdir -p "$TARGET"
#  fi
#
#  rsync -aH \
  #    "$SOURCE" "$TARGET" \
  #    && rsync -aH \
  #    "$SOURCE" "$TARGET" \
  #    && rm -fr "$SOURCE"
#else
#  echo "please choose the different dir!"
#fi
