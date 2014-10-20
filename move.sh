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

if [ $1 = / ]  || [ $2 = / ] 
then
  echo -e "${red}please not use / directory ! ... ${NC}"
  exit 1
fi

if [ -L ${1%/} ] || [ -L ${2%/} ]
then
  echo -e "${red}please not use simbo link ! ... ${NC}"
  exit 1
fi

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
  echo -e "${red}please choose the different dir! ... ${NC}"
  exit 1
fi
