#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color

SOURCE=`realpath "$1"`
TARGET=`realpath "$2"`

if [ "$SOURCE" != "$TARGET" ]
then
  if [ ! -d "$TARGET" ];
  then   
    mkdir -p "$TARGET"
  fi
  ~/bashrc/copy.sh "$1" "$2" \
  && ~/bashrc/copy.sh "$1" "$2" \
  && rsync --remove-source-files -aH --force "$1" "$2" \
    && rm -fr "$1"
else
  echo -e "${red}same dir --> ${SOURCE} ... ${NC}"
  echo -e "${red}please choose the different dir! ... ${NC}"
  exit 1
fi
