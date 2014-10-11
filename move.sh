#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
returnstring=""
function IsSlash()
{
  var=$1
  case $var in
    */)
      returnstring=$var 
      ;;
    *)
      returnstring=$var"/"
      ;;
  esac
}
IsSlash "$1"
SOURCE=$returnstring
IsSlash "$2"
TARGET=$returnstring

if [ "$SOURCE" != "$TARGET" ]
then
  if [ ! -d "$TARGET" ];
  then   
    mkdir -p "$TARGET"
  fi

  rsync -aH --force "$SOURCE" "$TARGET" \
    && rsync -aH --force "$SOURCE" "$TARGET" \
    && rm -fr "$SOURCE"
else
  echo "please choose the different dir!"
fi
