#!/bin/bash
SOURCE=$1
TARGET=$2

~/bashrc/move.sh "$SOURCE" "$TARGET" \
  && ln -s "$TARGET" "$SOURCE" 
