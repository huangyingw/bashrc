#!/bin/bash
SOURCE=$1
TARGET=$2
LNSOURCE=`echo $SOURCE | sed 's/\/$//'`

~/bashrc/move.sh "$SOURCE" "$TARGET" \
  && ln -s "$TARGET" "$LNSOURCE" 
